//
//  NetworkManager.swift
//  SwiftCoreDataSimpleDemo
//
//  Created by maheshbabu.somineni on 12/10/15.
//  Copyright © 2015 CHENHAO. All rights reserved.
//

import UIKit
//@objc
class NetworkManager: NSObject {
    
    class func request(type:GlobalVariables.RequestAPIType, parameters:[String:AnyObject], delegate:NetworkDelegate) {
        
        //Create enum from method name
        let requestMethod = parameters["method"] as! String
        
        var url:NSURL!
        var request:NSMutableURLRequest!
        //Url object creation
        switch type{
        case .GET:
           url = NSURL(string: GlobalVariables.requestURL  +  NetworkManager.getParamsURL(parameters: parameters))
           request = NSMutableURLRequest(url:url! as URL)
            break
        case .POST:
            url = NSURL(string: GlobalVariables.requestURL)
            //Parse header filed values
            /*request.setValue(GlobalVariables.request_content_type_value, forHTTPHeaderField: GlobalVariables.request_content_type_key)
             request.setValue(GlobalVariables.x_parse_application_id_value, forHTTPHeaderField: GlobalVariables.x_parse_application_id_key)
             request.setValue(GlobalVariables.x_parse_rest_api_value, forHTTPHeaderField: GlobalVariables.x_parse_rest_api_key)*/
            request.httpBody = NetworkManager.encodeParameters(parameters: parameters) as Data
            request = NSMutableURLRequest(url:url! as URL)

            break
        }

        
        //Conver params to json data
        request.httpMethod = type.rawValue as String
        
        //Start requesting
        if GlobalSingleton.sharedInstance.isNetworkAvailable(){
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                
                //Connection failed case
                if error != nil {
                    DispatchQueue.main.async { // 2
                        delegate.networkError(errorMessage: "Not connected to Internet!!")
                    }
                }else{
                    
                    do{
                        let jsonResult: Any = (try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers))
                        
                        delegate.dataDelegate(reponseData: jsonResult as AnyObject, requestMethod:requestMethod)
                        
                    }catch{
                       
                    }
                }
            }
            task.resume()
        }else{
            DispatchQueue.main.async { // 2
                delegate.networkError(errorMessage: "Not connected to Internet!!")
            }
        }

    }
    
    //Convert dictionary to json
    class func encodeParameters(parameters: [String : AnyObject]) -> NSData {
        
        do {
            
            //Conver dictionary to data
            let data = try JSONSerialization.data(withJSONObject: parameters, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            return data as NSData
            
        } catch let error as NSError {
            
            //Return empty object
            print(error)
            return NSData()
        }
        
    }
    //Convert dictionary to json
    class func getParamsURL(parameters: [String : AnyObject]) -> String {
        
        var getURL:String = "?"
        for (key, value) in parameters {
            if key != "method"{
                getURL = getURL + "\(key)" + "=" + "\(value)" + "&"
            }
        }
        return getURL.substring(to: getURL.index(before: getURL.endIndex))

    }

}
