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
    
    @StateObject var vm : DetailViewModel
        
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
        print("Initializing Detail View for \(String(describing: coin.name))")
    }
    
    var body: some View {
        Text("Hi")
        
    }
}

#Preview {
    DeatilView(coin: DeveloperPreview.instance.coin)
}
