//
//  Dish+Extension.swift
//  LittleLemonCapstoneMW
//
//  Created by Michael Wilson on 8/8/23.
//

import Foundation
import CoreData

extension Dish {
    
    static func createDishesFrom(menuItems: [MenuItem],
                                 _ context: NSManagedObjectContext) {
        
        for menuItem in menuItems {
            guard let _ = exists(name: menuItem.title, context) else {
                continue
            }
            let oneDish = Dish(context: context)
            oneDish.name = menuItem.title
            oneDish.dishDescription = menuItem.description
            oneDish.price = menuItem.price
            oneDish.image = menuItem.image
            oneDish.category = menuItem.category
            
        }
            
    }
    
   static func exists(name: String,
                _ context: NSManagedObjectContext) -> Bool? {
        let request = Dish.request()
        let predicate = NSPredicate(format: "name CONTAINS[cd] %@", name)
        request.predicate = predicate
        
        do {
            guard let results = try context.fetch(request) as? [Dish]
            else {
                return nil
            }
            return results.count > 0
        } catch (let error){
            print(error.localizedDescription)
            return false
        }
    }
}
