//
//  AccessControlExample.swift
//  framework
//
//  Created by apple on 05/05/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
class RootViewController: UIViewController {
    fileprivate(set) var someFlag = false
    
    func callingFunc(){
        
        self.newFunc()
    }
}
extension RootViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(someFlag)
    }
    // Not accessible outside of this extension
    private func handle(text: String?) {
        // do something
    }
    
    func newFunc(){
        
    }
}
