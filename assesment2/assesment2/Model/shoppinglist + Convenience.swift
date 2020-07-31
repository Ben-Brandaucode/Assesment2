//
//  shoppinglist + Convenience.swift
//  assesment2
//
//  Created by Ben Brandau Brandau on 7/31/20.//https://github.com/Ben-Brandaucode/Assesment2
//  Copyright © 2020 Ben Brandau. All rights reserved.
//

import Foundation
import CoreData

extension ShoppingList {
    convenience init (itemName: String, isBought: Bool = false, context: NSManagedObjectContext = CoreDataStack.context){
        self.init(context: context)
        self.itemName = itemName
        self.isBought = isBought
    }
}

