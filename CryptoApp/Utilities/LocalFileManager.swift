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
        
        //create folder
        createFolderIfNeeded(folderName: folderName)
        
        //get path for image
        guard let data = image.pngData(),
        let url = getURLForImage(imageName: imageName, folderName: folderName)
        else {return}
        
        // save image to path
        do{
            try data.write(to: url)
        } catch let error{
            print("Error saving image \(imageName)")
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //create folder if needed
    private func createFolderIfNeeded(folderName: String){
        
        guard let url = getURLForFolder(folderName: folderName) else {return}
        
        if !FileManager.default.fileExists(atPath: url.path){
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print("Error creating directory. FolderName: \(folderName)")
            }
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
