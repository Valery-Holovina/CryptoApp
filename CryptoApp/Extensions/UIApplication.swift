//
//  UIApplication.swift
//  CryptoApp
//
//  Created by Valery on 29.09.2025.
//

import Foundation
import SwiftUI

extension UIApplication{
    
    func endEditing(){
        //will dismiss keyboard
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
