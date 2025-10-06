//
//  PortfolioView.swift
//  CryptoApp
//
//  Created by Valery on 06.10.2025.
//

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject private var vm : HomeViewModel
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 0) {
                    SearchBarView(searchText: $vm.searchText)
                    
                    ScrollView(.horizontal) {
                        LazyHStack( spacing: 10) {
                            ForEach(vm.allCoins) { coin in
                                Text(coin.symbol.uppercased())
                            }
                        }
                    }
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    XMarkButton()

                }
            }
            
            
            
        }
    }
}

#Preview {
    PortfolioView()
        .environmentObject(DeveloperPreview.instance.homeVM)
}
