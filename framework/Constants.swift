//
//  Constants.swift
//  GameFramework
//
//  Created by apple on 1/16/15.
//  Copyright (c) 2015 apple. All rights reserved.
//

import UIKit

struct GlobalVariables {
    static let globalUserDefaults = UserDefaults.standard
    static let globalSingleton =  GlobalSingleton.sharedInstance
    static let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //Service calls values
    static let requestURL = "https://newsapi.org/v1/articles"
    static let request_type_value = "POST"
    static let apiKey = "a3047433831046d99b4b7c5d2bab163e"
    
    enum RequestAPIMethods : NSString{
        case getNewsFeed = "getNewsFeed"
    }
    enum RequestAPIType : NSString{
        case GET = "GET"
        case POST = "POST"
    }
    
    enum CoreDataEntities : NSString{
        case NewsFeed = "NewsFeed"
        
    }
}

