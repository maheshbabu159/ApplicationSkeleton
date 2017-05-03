//
//  BaseClassProtocols.swift
//  framework
//
//  Created by apple on 02/05/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import MBProgressHUD
protocol NetworkDelegate{
    func dataDelegate(reponseData:AnyObject, requestMethod:String)
    func networkError(errorMessage:String)
}
protocol MBProgressHUDProtocol{
    var hud: MBProgressHUD { get set}
}
protocol ShowsAlert {

}

extension ShowsAlert where Self: UIViewController {
    func showAlert(title: String = "Error", message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

