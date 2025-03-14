//
//  HomeVM.swift
//  CryptoPocket
//
//  Created by Вадим Игнатенко on 14.03.25.
//

import Foundation


final class HomeVM {
    
    func getArrayCoins() -> [CryptoResponse] {
        var arrayCoins: [CryptoResponse] = []
        let coins = CoinsAPI.allCases
        let dispatchGroup = DispatchGroup()
        coins.forEach { NetworkServices.shared.fetchCoin(coin: $0 ) { result, error in
            dispatchGroup.enter()
            if let error = error { print(" * \(#function) Error: \(error)") }
            if let result { DispatchQueue.global().sync { arrayCoins.append(result) } }
            dispatchGroup.leave()
            }
        }
        dispatchGroup.wait()
        return arrayCoins
    }

}
