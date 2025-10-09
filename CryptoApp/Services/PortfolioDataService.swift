//
//  PortfolioDataService.swift
//  CryptoApp
//
//  Created by Valery on 09.10.2025.
//

import Foundation
import CoreData

class PortfolioDataService{
    
     private let container: NSPersistentContainer
    private let containerName = "PortfolioContainer"
    private let entityName: String = "PortfolioEntity"
    
    @Published var savedEntities : [PortfolioEntity] = []
    
    init(){
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error = error{
                print("Error loading core data!")
                
            }
        }
        
    }
    private func getPortfolio(){
        let request = NSFetchRequest<PortfolioEntity>(entityName: entityName)
        do {
            savedEntities =  try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching")
        }
    }
    
    private func add(coin: CoinModel, amount: Double){
        let entity = PortfolioEntity(context: container.viewContext)
        entity.amount = amount
        entity.coinID = coin.id
    }
    
    
}
