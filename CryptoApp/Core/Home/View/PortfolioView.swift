//
//  PortfolioView.swift
//  CryptoApp
//
//  Created by Valery on 06.10.2025.
//

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject private var vm : HomeViewModel
    @State private var selectedCoin : CoinModel? = nil
    @State private var quantityText: String  = ""
    @State private var showCheckmaek : Bool = false
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 0) {
                    SearchBarView(searchText: $vm.searchText)
                    coinLogoList
                    
                    if selectedCoin != nil{
                       
                        portfolioInputSection
                            .padding(9)
                            .animation(.none)
                         
                    }
                }
            }
            .background(Color.theme.background.ignoresSafeArea())
            
            .scrollIndicators(.hidden)
            .navigationTitle("Edit Portfolio")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    XMarkButton()

                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    trailinNavBarButtons
                }
            }
            .onChange(of: vm.searchText) { oldValue, newValue in
                if newValue == ""{
                    removeSelectedcoin()
                }
            }
            
            
            
        }
    }
}

#Preview {
    PortfolioView()
        .environmentObject(DeveloperPreview.instance.homeVM)
}

extension PortfolioView{
    
    private var coinLogoList : some View{
        ScrollView(.horizontal) {
            LazyHStack( spacing: 10) {
                ForEach(vm.searchText.isEmpty ? vm.portfolioCoins : vm.allCoins) { coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                updateSelectedCoin(coin: coin)
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(
                                    selectedCoin?.id == coin.id ?
                                    Color.theme.green : Color.clear, lineWidth: 1)
                        )
                }
            }
            .padding(.vertical, 4)
            .padding(.leading)
        }

    }
    
    private func updateSelectedCoin(coin: CoinModel){
        selectedCoin = coin
        
        if let portfolioCoin = vm.portfolioCoins.first(where: {$0.id == coin.id}),
           let amount = portfolioCoin.currentHoldings{
            quantityText = "\(amount)"
        }else{
            quantityText = ""
        }
    }
    
    private func getCurrentValue() -> Double{
        if let quantity = Double(quantityText){
            return quantity * (selectedCoin?.currentPrice ?? 0)
        }
        return 0
    }
    
    private var portfolioInputSection : some View{
        VStack(spacing: 20) {
            HStack{
                Text("Current price of \(selectedCoin?.symbol.uppercased() ?? ""):")
                Spacer()
                Text(selectedCoin?.currentPrice.asCurrencyWith6Decimals() ?? "")
            }
            Divider()
            HStack{
                Text("Amount holding: ")
                Spacer()
                TextField("Ex: 1.4", text: $quantityText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            Divider()
            HStack{
                Text("Current value: ")
                Spacer()
                Text(getCurrentValue().asCurrencyWith2Decimals())
                
            }
        }
    }
    
    
    private var trailinNavBarButtons : some View{
        HStack(spacing: 10){
            Image(systemName: "checkmark")
                .opacity(showCheckmaek ? 1.0 : 0.0)
            
            Button {
                saveButtonPressed()
            } label: {
                Text("Save".uppercased())
                    .font(.headline)
                    .opacity(
                        (selectedCoin != nil && selectedCoin?.currentPrice != Double(quantityText)) ? 1.0 : 0.0
                    )
            }
           

           
        }

    }
    
    private func saveButtonPressed(){
        guard
            let coin = selectedCoin,
            let amount = Double(quantityText)
        else {return}
        
        // save portfolio
        vm.updatePortfolio(coin: coin, amount: amount)
        
        // show checkmark
        withAnimation(.easeIn) {
            showCheckmaek = true
            removeSelectedcoin()
            
        }
        // hide keyboard
        UIApplication.shared.endEditing()
        
        //hide checkmark
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            withAnimation(.easeOut) {
                showCheckmaek = false
            }
        }
        
    }
    
    private func removeSelectedcoin(){
        selectedCoin = nil
        vm.searchText = ""
    }
}
