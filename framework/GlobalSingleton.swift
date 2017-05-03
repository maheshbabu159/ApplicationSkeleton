//
//  GlobalSingleton.swift
//  GameFramework
//
//  Created by apple on 1/14/15.
//  Copyright (c) 2015 apple. All rights reserved.
//

//http://stackoverflow.com/questions/37953317/singleton-with-properties-in-swift-3

import Foundation

class GlobalSingleton {
    
    // MARK: - Shared Instance
    static let sharedInstance: GlobalSingleton = {
        let instance = GlobalSingleton()
        // setup code
        return instance
    }()
    
    // MARK: - Initialization Method
}
