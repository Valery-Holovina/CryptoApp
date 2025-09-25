//
//  LocalFileManager.swift
//  CryptoApp
//
//  Created by Valery on 25.09.2025.
//

import Foundation
import SwiftUI

class LocalFileManager{
    
    static let instance = LocalFileManager()
    
    private init(){}
    
    func savedImage(image: UIImage){
        
        guard let data = image.pngData(),
        let url = URL(string: "")
        else {return}
        
        do{
            try data.write(to: url)
        } catch let error{
            print("Error saving image")
        }
    }
    
    //URL for the folder
    private func getURLForFolder(name: String) -> URL?{
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else
        {return nil}
        return url.appendingPathComponent(name)
    }
    
    
    
}
