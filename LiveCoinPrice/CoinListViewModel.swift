//
//  CoinListViewModel.swift
//  LiveCoinPrice
//
//  Created by Giresh Dora on 07/02/22.
//

import Combine
import Foundation
import SwiftUI

class CoinListViewModel: ObservableObject{
    
   
    @Published  private(set) var coins: [Coin] = []
    
    private let service: CoinPriceService
    private var subscriptions = Set<AnyCancellable>()
    
    private let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.currencyCode = "USD"
        return formatter
    }()
    
    init(service: CoinPriceService = .init()){
        self.service = service
    }
    
    func subscribeToService(){
        service.coinDictionarySubject
            .receive(on: DispatchQueue.main)
            .sink { [weak self] returnedValye in
                self?.coins = returnedValye.map{$1}.sorted(by: { coin1, coin2 in
                    return coin1.value > coin2.value
                })
            }
            .store(in: &subscriptions)
    }
    
    func valueText(for coinValue: Double) -> String{
        if let value = self.currencyFormatter.string(from: NSNumber(value: coinValue)){
            return value
        }else{
            return "Updating..."
        }
    }
}
