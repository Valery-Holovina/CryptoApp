//
//  ContentView.swift
//  CryptoApp
//
//  Created by Valery on 12.09.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
            VStack{
                Text("accentColor")
                    .foregroundStyle(Color.theme.accent)
                
                Text("Secondary")
                    .foregroundStyle(Color.theme.secondaryText)
                Text("red")
                    .foregroundStyle(Color.theme.red)
                Text("green")
                    .foregroundStyle(Color.theme.green)
            }
            .font(.headline)
          
        }
    }
}

#Preview {
    ContentView()
}
