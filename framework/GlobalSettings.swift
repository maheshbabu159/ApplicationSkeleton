//
//  GlobalSettings.swift
//  framework
//
//  Created by apple on 02/05/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class GlobalSettings{
    class func setNavigationBarProperties(){
        UINavigationBar.appearance().barTintColor = UIColor(red: 96.0/255.0, green: 1.0/255.0, blue: 210.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
    }
    
    class func getStringFromDate(date:NSDate) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.long
        dateFormatter.timeStyle = DateFormatter.Style.short

        let dateString = dateFormatter.string(from:date as Date)
        return dateString
    }
}
