//
//  MoviesModel.swift
//  PlainSwiftFramework
//
//  Created by maheshbabu.somineni on 12/17/15.
//  Copyright © 2015 maheshbabu.somineni. All rights reserved.
//

import Foundation
import CoreData

class NewsFeed: NSManagedObject {
    
    // Insert code here to add functionality to your managed object subclass
    class func insertObject(dictionary:[String:String], context:NSManagedObjectContext) {
        
        // Create Managed Object
        let entityDescription = NSEntityDescription.entity(forEntityName: GlobalVariables.CoreDataEntities.NewsFeed.rawValue as String, in: context)
        
        //Create new entity
        let newEntity:NewsFeed = NSManagedObject(entity: entityDescription!, insertInto: context) as! NewsFeed
        
        //Set propert values
        if let value = dictionary["author"] {
            newEntity.cast = value
        }
        if let value = dictionary["title"] {
            newEntity.name = value
        }
        if let value = dictionary["description"] {
            newEntity.descrption = value
        }
        if let value = dictionary["publishedAt"] {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            let date = dateFormatter.date(from: value)
            newEntity.releaseDate = date as NSDate?
        }
        if let value = dictionary["urlToImage"] {
            newEntity.industry = value
        }
        if let value = dictionary["url"]{
            newEntity.objectId = value
        }
        
        //Save the object
        do {
            try newEntity.managedObjectContext?.save()
        } catch {
            print(error)
        }
    }
    class func updateObject() {
        
        
    }
    class func truncateAllObject() {
        
        
    }
    class func truncateAllObjects(context:NSManagedObjectContext) {
        
        CommonOperations.truncateAllObjects(entityName: GlobalVariables.CoreDataEntities.NewsFeed.rawValue as String, context: context)
    }
    class func fetchAllObjects(context:NSManagedObjectContext) -> NSArray {
        
        let resultArray:[NewsFeed] = CommonOperations.fetchAllObjects(entityName: GlobalVariables.CoreDataEntities.NewsFeed.rawValue as String, context: context) as! [NewsFeed]
        let sortedArray = resultArray.sorted(by: { $0.releaseDate?.compare($1.releaseDate as! Date) == .orderedDescending })
        return sortedArray as NSArray
    }
    
}
