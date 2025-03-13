//
//  NetworkServices.swift
//  CryptoPocket
//
//  Created by Вадим Игнатенко on 13.03.25.
//

import Foundation


enum CoinsAPI: String, CaseIterable {
    case bitcoin = "btc"
    case ethereum = "eth"
    case tron = "trx"
    case terra = "luna"
    case polkadot = "dot"
    case dogecoin = "doge"
    case tether = "usdt"
    case stellar = "xlm"
    case cardano = "ada"
    case ripple = "xrp"
}

struct CoinModel: Decodable {
    
}

final class NetworkServices {
    
    static let shared = NetworkServices()
    private init() {}
    
    func fetchCoin (coin: CoinsAPI, callback: @escaping (_ result: CoinModel?, _ error: Error?) -> ()) {
        guard let url = URL(string: "https://data.messari.io/api/v1/assets/\(coin.rawValue)/metrics") else { print(" * \(#function) - невалидный URL"); return }
        fetchData(from: url, completion: callback)
    }
    
    private func fetchData (from url: URL, completion: @escaping (CoinModel?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            if let error { print(" * \(#function) - \(error)"); return  }
            guard let data else { print(" * \(#function) - нет даты"); return }
            let result = self?.parseJSON(data: data)
            completion(result, error)
        }.resume()
    }
    
    private func parseJSON ( data: Data) -> CoinModel? {
        do {
            return try JSONDecoder().decode(CoinModel.self, from: data)
        } catch {
            print(" * \(#function) - \(error)")
            return nil
        }
    }
}
