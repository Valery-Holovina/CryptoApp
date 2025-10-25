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
    
    @StateObject private var vm : DetailViewModel
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    private let spacing: CGFloat = 30
        
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                Text("")
                    .frame(height: 150)
                overview
                Divider()
                overviewGrid
                
              
              
                additional
                Divider()
                additionalGrid

               
            }
            .padding()
            
        }
        .navigationTitle(vm.coin.name)
        
    }
}

#Preview {
    NavigationStack{
        DeatilView(coin: DeveloperPreview.instance.coin)
    }
}

extension DeatilView{
    private var overview: some View{
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundStyle(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var additional: some View{
        Text("Additional Details")
            .font(.title)
            .bold()
            .foregroundStyle(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    private var overviewGrid: some View{
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: spacing,
            pinnedViews: []) {
                ForEach(vm.overviewStatistics) { stat in
                    StatisticView(stat: stat)
                }
            }

    }
    private var additionalGrid: some View{
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: spacing,
            pinnedViews: []) {
                ForEach(vm.additionalStatistics) { stat in
                    StatisticView(stat: stat)
                }
            }

    }
}
