//
//  LiveCoinPriceApp.swift
//  LiveCoinPrice
//
//  Created by Giresh Dora on 07/02/22.
//

import SwiftUI

@main
struct LiveCoinPriceApp: App {
    
    let coinCapService = CoinPriceService()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView(viewModel: CoinListViewModel(service: coinCapService))
                    .onAppear {
                        setupCoinCapService()
                    }
            }
        }
    }
    
    func setupCoinCapService() {
        coinCapService.connect()
        coinCapService.startMonitorNetworkConnectivity()
    }
}
