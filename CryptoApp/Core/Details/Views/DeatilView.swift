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
                Text("Overview")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color.theme.accent)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                LazyVGrid(
                    columns: columns,
                    alignment: .leading,
                    spacing: spacing,
                    pinnedViews: []) {
                        ForEach(0..<6) { _ in
                            StatisticView(stat: StatisticModel(title: "Title", value: "Value"))
                        }
                    }
                
                
                Text("Additional Details")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color.theme.accent)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                
                LazyVGrid(
                    columns: columns,
                    alignment: .leading,
                    spacing: spacing,
                    pinnedViews: []) {
                        ForEach(0..<6) { _ in
                            StatisticView(stat: StatisticModel(title: "Title", value: "Value"))
                        }
                    }

               
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
