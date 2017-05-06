//
//  OptionalsExample.swift
//  framework
//
//  Created by apple on 04/05/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation

class OptionalsExample{
    
    class func forcedUnwrapping(){
        
        //Forced unwrapping is used when we sure about having the value
        var customer:Customer!
        customer = nil
        //Gets runtime error if the object is not available.
        print(customer.name)
        
    }
    
    
}
