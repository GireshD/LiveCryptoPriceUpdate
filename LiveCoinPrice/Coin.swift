//
//  Coin.swift
//  CryptoTracker
//
//  Created by Alfian Losari on 03/02/22.
//

import Foundation

struct Coin: Identifiable {
    let id = UUID()
    let name: String
    let value: Double
    
}
