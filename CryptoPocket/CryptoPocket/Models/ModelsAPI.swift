//
//  ModelsAPI.swift
//  CryptoPocket
//
//  Created by Вадим Игнатенко on 14.03.25.
//

import Foundation

// Основная структура ответа
struct CryptoResponse: Codable {
    let data: CryptoData
}

struct CryptoData: Codable {
    let id: String
    let serialId: Int
    let symbol: String
    let name: String
    let slug: String
    let marketData: MarketData
    let marketcap: Marketcap

    enum CodingKeys: String, CodingKey {
        case id
        case serialId = "serial_id"
        case symbol
        case name
        case slug
        case marketData = "market_data"
        case marketcap
    }
}

// Рыночные данные
struct MarketData: Codable {
    let priceUsd: Double
    let volumeLast24Hours: Double

    // Маппинг JSON-ключей на свойства
    enum CodingKeys: String, CodingKey {
        case priceUsd = "price_usd"
        case volumeLast24Hours = "volume_last_24_hours"
    }
}

struct Marketcap: Codable {
    let rank: Int
    let currentMarketcapUsd: Double

    enum CodingKeys: String, CodingKey {
        case rank
        case currentMarketcapUsd = "current_marketcap_usd"
    }
}
