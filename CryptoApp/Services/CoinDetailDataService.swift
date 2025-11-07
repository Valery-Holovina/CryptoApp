//
//  CoinDetailDataService.swift
//  CryptoApp
//
//  Created by Valery on 24.10.2025.
//

import Foundation
import Combine

class CoinDetailDataService{
    
    @Published var coinDetails: CoinDetailModel? = nil
//    var cncellables = Set<AnyCancellable>()
    
    var coinDetailSubscription: AnyCancellable?
    let coin: CoinModel
    
    init(coin: CoinModel){
        self.coin = coin
        getCoinDeatils()
    }
    
     func getCoinDeatils(){
        
         guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false")
        else {return}
        
         coinDetailSubscription = NetworkingManager.download(url: url)
             .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
             .receive(on: DispatchQueue.main)
            
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedCoinDetails in
                self?.coinDetails = returnedCoinDetails
                self?.coinDetailSubscription?.cancel()
            })
           
        
//            .store(in: &cncellables)
        
    }
}
