//
//  DeatilView.swift
//  CryptoApp
//
//  Created by Valery on 22.10.2025.
//

import SwiftUI

struct DeatilView: View {
    
    @Binding var coin: CoinModel?
    
    init(coin: Binding<CoinModel?>) {
        self._coin = coin
        print("Initializing Detail View for \(String(describing: coin.wrappedValue?.name))")
    }
    
    var body: some View {
        Text(coin?.name ?? "")
        
    }
}

#Preview {
    DeatilView(coin: .constant(DeveloperPreview.instance.coin))
}
