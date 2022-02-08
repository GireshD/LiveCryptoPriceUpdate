//
//  ContentView.swift
//  LiveCoinPrice
//
//  Created by Giresh Dora on 07/02/22.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var viewModel: CoinListViewModel
    
    var body: some View {
        NavigationView{
           
            List{
                ForEach(viewModel.coins){ coin in
                    HStack {
                        Text(coin.name).font(.headline)
                        Spacer()
                        Text(viewModel.valueText(for: coin.value))
                            .frame(alignment: .trailing)
                            .font(.body)
                        
                        
                    }
                }
            }
            .listStyle(PlainListStyle())
            
        }
        .navigationTitle("Coin Live Price")
        .onAppear{
            viewModel.subscribeToService()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: CoinListViewModel())
    }
}
