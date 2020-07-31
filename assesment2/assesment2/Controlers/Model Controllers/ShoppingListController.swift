//
//  ShoppingListController.swift
//  assesment2
//
//  Created by Ben Brandau Brandau on 7/31/20.
//  Copyright © 2020 Ben Brandau. All rights reserved.
//

import Foundation
import CoreData

class ShoppingListController {
    
//MARK:Shared Instance
    static let shared = ShoppingListController()
    
//MARK: Properties{
    let fetchedResultsController: NSFetchedResultsController<ShoppingList> = {
        let fetchRequest: NSFetchRequest<ShoppingList> = ShoppingList.fetchRequest()
        let purchased = NSSortDescriptor(key: "isBought", ascending: false)
        
        fetchRequest.sortDescriptors = [purchased]
        
        return NSFetchedResultsController( fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "isBought", cacheName: nil)
    }()
    
    init(){
        do{
            try fetchedResultsController.performFetch()
        } catch{
             print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
    
//MARK: CRUD
    
    func createItem(itemName: String, isBought: Bool){
        _ = ShoppingList(itemName: itemName, isBought:isBought)
        saveToPersistence()
        
    }
    func updateList( listItem: ShoppingList){
        listItem.isBought = !listItem.isBought
        saveToPersistence()
        
    }
    
    func remove(listItem: ShoppingList){
        let moc = CoreDataStack.context
        moc.delete(listItem)
        saveToPersistence()
        
    }
    func saveToPersistence(){
        do{
            try CoreDataStack.context.save()
        }catch{
             print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
    
    
    
}// end of class
