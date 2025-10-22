//
//  DeatilView.swift
//  CryptoApp
//
//  Created by Valery on 22.10.2025.
//

import SwiftUI



struct DetailLoadingView: View {
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack{
            if let coin = coin{
                DeatilView(coin: coin)
            }
        }
    }
}



struct DeatilView: View {
    
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        print("Initializing Detail View for \(String(describing: coin.name))")
    }
    
    var body: some View {
        Text(coin.name)
        
    }
}

#Preview {
    DeatilView(coin: DeveloperPreview.instance.coin)
}
