//
//  XMarkButton.swift
//  CryptoApp
//
//  Created by Valery on 06.10.2025.
//

import SwiftUI

struct XMarkButton: View {
    
    @Environment(\.dismiss) var dismissSheet
    
    var body: some View {
        Button {
            dismissSheet
            
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
        }

    }
}

#Preview {
    XMarkButton()
}
