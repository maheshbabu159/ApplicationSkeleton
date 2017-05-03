//
//  NewsFeed+CoreDataProperties.swift
//  framework
//
//  Created by apple on 02/05/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import CoreData


extension NewsFeed {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewsFeed> {
        return NSFetchRequest<NewsFeed>(entityName: "NewsFeed");
    }

    @NSManaged public var cast: String?
    @NSManaged public var descrption: String?
    @NSManaged public var industry: String?
    @NSManaged public var movieLenght: NSNumber?
    @NSManaged public var name: String?
    @NSManaged public var objectId: String?
    @NSManaged public var photo: NSObject?
    @NSManaged public var releaseDate: NSDate?

}
