//
//  Stock.swift
//  Stocks
//
//  Created by Bob on 14/02/21.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}
