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
    
    func savedImage(image: UIImage, imageName: String, folderName: String){
        
        guard let data = image.pngData(),
        let url = getURLForImage(imageName: imageName, folderName: folderName)
        else {return}
        
        do{
            try data.write(to: url)
        } catch let error{
            print("Error saving image")
        }
    }
    
    //URL for the folder
    private func getURLForFolder(folderName: String) -> URL?{
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else
        {return nil}
        return url.appendingPathComponent(folderName)
    }
    
    // URL for the image
    private func getURLForImage(imageName: String, folderName: String) -> URL?{
        guard let folderURL = getURLForFolder(folderName: folderName) else{
            return nil
        }
        return folderURL.appendingPathComponent(imageName + ".png")
    }
    
}
