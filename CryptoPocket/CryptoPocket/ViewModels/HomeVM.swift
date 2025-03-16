//
//  HomeVM.swift
//  CryptoPocket
//
//  Created by Вадим Игнатенко on 14.03.25.
//

import Foundation

final class HomeVM {
    
    private var sortedList = false
    var coins: [CryptoResponse] = []

    func getArrayCoins(completion: @escaping () -> ()) {
        var arrayCoins: [CryptoResponse] = []
        let coins = CoinsAPI.allCases
        let dispatchGroup = DispatchGroup()
        let serialQueue = DispatchQueue(label: "com.example.serialQueue")
        coins.forEach {
            dispatchGroup.enter()
            NetworkServices.shared.fetchCoin(coin: $0) { result, _ in
                serialQueue.async {
                    if let result = result { arrayCoins.append(result) }
                }
                dispatchGroup.leave()
            }
        }
        dispatchGroup.notify(queue: .main) { [weak self] in
            self?.coins = arrayCoins
            self?.sortCoins()
            completion()
        }
    }
    
    func sortCoins(updateList: Bool = false) {
        sortedList = updateList ? !sortedList : sortedList
        sortedList ? coins.sort { $0.data.marketData.priceUsd > $1.data.marketData.priceUsd } :
        coins.sort { $0.data.marketData.priceUsd < $1.data.marketData.priceUsd }
    }
}
