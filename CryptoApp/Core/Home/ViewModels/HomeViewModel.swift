//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Valery on 17.09.2025.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject{
    
    
    @Published var statistics : [StatisticModel] = [
        StatisticModel(title: "Title", value: "Value", percentageChange: 1),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value", percentageChange: -3)
    ]
    
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    @Published var searchText:String = ""
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
   
    init(){
        addSubscribers()
    }
    
    func addSubscribers(){
//        dataService.$allCoins
//            .sink { [weak self] returnedCoins in
//                self?.allCoins = returnedCoins
//            }
//            .store(in: &cancellables)
        
        
        //updates all coins
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main) // will wait 0.5 sec before running
            .map(filteredCoin)
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    private func filteredCoin(text: String, coins: [CoinModel])-> [CoinModel]{
        guard !text.isEmpty else{
            return coins
        }
        let lowercasedText = text.lowercased()
        
        return coins.filter { coin in
            return
            coin.name.lowercased().contains(lowercasedText) ||
            coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.lowercased().contains(lowercasedText)
        }
    }
}

