//
//  String.swift
//  CryptoApp
//
//  Created by Valery on 04.11.2025.
//

import Foundation

extension String{
    var removingHTMLOccurances: String{
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
