//
//  ClassesStructres.swift
//  framework
//
//  Created by apple on 04/05/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
/*Inheritance enables one class to inherit the characteristics of another.
Type casting enables you to check and interpret the type of a class instance at runtime.
Deinitializers enable an instance of a class to free up any resources it has assigned.
Reference counting allows more than one reference to a class instance.*/

class Classes{
    
    class func testReferenceTypes(){
       let object =  Classes()
        object.printValues()
        
    }
    func printValues(){
        let array1 = [1,2,3,4,5]
        var array2 = array1
        array2.append(6)
        print(array1.count)
        print(array2.count)
    }
}
struct Structres{
    let array1 = [1,2,3,4,5]
    
    static func testReferenceTypes(){
        let object =  Structres()
        object.printValues()
    }
    func printValues(){
        let array1 = [1,2,3,4,5]
        var array2 = array1
        array2.append(6)
        print(array1.count)
        print(array2.count)
    }
}
