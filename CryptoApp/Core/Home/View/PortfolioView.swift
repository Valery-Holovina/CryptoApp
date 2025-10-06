//
//  PortfolioView.swift
//  CryptoApp
//
//  Created by Valery on 06.10.2025.
//

import SwiftUI

struct PortfolioView: View {
    
    @Environment(\.dismiss) var dismissSheet
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 0) {
                    Text("hi")
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
}
