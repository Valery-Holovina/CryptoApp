//
//  SettingsView.swift
//  CryptoApp
//
//  Created by Valery on 05.11.2025.
//

import SwiftUI

struct SettingsView: View {
    
    let defaultURL = URL(string: "https://www.google.com")!
    let coingekoURL = URL(string: "https://www.coingecko.com")!
    let personalURL = URL(string: "https://github.com/Valery-Holovina")!
   
    
    var body: some View {
        NavigationStack{
            List{
                sectionInfo
                sectionCoinGecko
                sectionDeveloper
                sectionApplication
            }
            .listStyle(.grouped)
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    XMarkButton()
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}

extension SettingsView{
    private var sectionInfo : some View{
        Section {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was made by following a @SwiftfulThinking course on YouTube. It uses MVVM Architecture, Combine, and CoreData!")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            
           
        } header: {
            Text("Swiftful Thinking")
        }
    }
    
    private var sectionCoinGecko : some View{
        Section {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryptocurrency data that is used in this app comes from API from CoinGecko! Prices may be slightly delayed")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko", destination: coingekoURL)
                .tint(.blue)
            
           
        } header: {
            Text("CoinGecko")
        }
    }
    
    private var sectionDeveloper : some View{
        Section {
            VStack(alignment: .leading) {
                Image("me")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was developed by Valery Holovina. I have watched over 120 videos of SwiftUI and mainly learn on Swiftful Thinking chanel.\nThe project benefits from multi-threading, publishers/subscribers ,and data persistance ")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit my github", destination: personalURL)
                .tint(.blue)
            
           
        } header: {
            Text("CoinGecko")
        }
    }
    
    private var sectionApplication : some View{
        Section {
            Link("Terms of Service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
         
             
            }
          header: {
            Text("Application")
        }
    }



}
