
//
//  FacadePracticeClass.swift
//  framework
//
//  Created by apple on 04/05/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
class FacadePracticeClass {
    class func retainCycle(){
        
        //Checking weak and strong retain cycles
        /*var john: Person?
        var unit4A: Apartment?
        
        john = Person(name: "John Appleseed")
        unit4A = Apartment(unit: "4A")
        
        john!.apartment = unit4A
        unit4A!.tenant = john
        john = nil*/
        
        //Checking unowned retain cycles
        var cutomer: Customer?
        cutomer = Customer(name: "John Appleseed")
        cutomer!.card = CreditCard(number: 1234_5678_9012_3456, customer: cutomer!)
        cutomer = nil

    }
    class func optionals(){
        
        
        
    }
    
    class func classesStructres(){
        
        Classes.testReferenceTypes()
        Structres.testReferenceTypes()
    }
    class func staticLibrary(){
        let sl = StaticLibraryExample()
        _ = sl.originalImage
        
    }
}
