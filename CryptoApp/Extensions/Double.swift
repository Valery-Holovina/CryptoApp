//
//  Double.swift
//  CryptoApp
//
//  Created by Valery on 16.09.2025.
//

import Foundation

extension Double{
    
    // makes documentation when you hold oprion and click on currencyFormatter6
    
    /// converts a double into a Currency with 2-6 decimal places
    /// ```
    ///Convert 1234.56 to $1,234.56
    ///Convert 12.3456 to $12.23456
    ///Convert 0.123456 to $0.123456
    /// ```
    
    private var currencyFormatter6: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        //formatter.locale = .current // default value
        //formatter.currencyCode = "usd" // to change the currency
        //formatter.currencySymbol = "$" // to change currency symbol
        
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    // public to access from our code
    
    /// converts a double into a Currency as string with 2-6 decimal places
    /// ```
    ///Convert 1234.56 to "$1,234.56"
    ///Convert 12.3456 to "$12.23456"
    ///Convert 0.123456 to "$0.123456"
    /// ```

    func asCurrencyWith6Decimals() -> String{
        let number = NSNumber(value: self) // current number
        return currencyFormatter6.string(from: number) ?? "$0.000"
    }
}
