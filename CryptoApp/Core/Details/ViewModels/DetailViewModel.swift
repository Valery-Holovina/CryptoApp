//
//  DetailViewModel.swift
//  CryptoApp
//
//  Created by Valery on 24.10.2025.
//

import Foundation
import Combine

class DetailViewModel{
    
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers(){
        coinDetailService.$coinDetails
            .sink { returnedCoinDetails in
                print("Received coin detail data")
                print(returnedCoinDetails)
            }
            .store(in: &cancellables)
    }
}
