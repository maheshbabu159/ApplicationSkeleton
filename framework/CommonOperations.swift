//
//  CommonOperations.swift
//  SwiftCoreDataSimpleDemo
//
//  Created by maheshbabu.somineni on 12/11/15.
//  Copyright © 2015 CHENHAO. All rights reserved.
//

import UIKit
import CoreData

class CommonOperations: NSObject {

  
    class func fetchAllObjects(entityName:String, context:NSManagedObjectContext) -> NSArray {
        
        // Initialize Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        
        // Create Entity Description
        let entityDescription = NSEntityDescription.entity(forEntityName: entityName, in: context)
        
        // Configure Fetch Request
        fetchRequest.entity = entityDescription
        
        do {
            
            let result = try context.fetch(fetchRequest)
            return result as NSArray
            
        } catch {
            
            print(error as NSError)
            return NSArray()
        }
    }
    class func truncateAllObjects(entityName:String, context:NSManagedObjectContext) {
        
        //Fetch object
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        
        //Fetch request properties
        fetchRequest.entity = NSEntityDescription.entity(forEntityName: entityName, in: context)
        fetchRequest.includesPropertyValues = false
        
        //Execute request
        do {
            if let resultsArray = try context.fetch(fetchRequest) as? [NSManagedObject] {
               
                for result in resultsArray {
                    
                    context.delete(result)
                }
                
                try context.save()
            }
        } catch {
            
            print(error as NSError)
        }
    }
}
