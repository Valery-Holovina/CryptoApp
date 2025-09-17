//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Valery on 12.09.2025.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    
    @StateObject private var vm = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                HomeView()
                    .toolbarVisibility(.hidden, for: .navigationBar)
            }
            .environmentObject(vm)
          
        }
    }
}
