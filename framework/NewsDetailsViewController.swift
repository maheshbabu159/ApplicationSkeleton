//
//  NewsDetailsViewController.swift
//  framework
//
//  Created by apple on 02/05/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    var detailsObject:NewsFeed!
    
    @IBOutlet var webView: UIWebView!
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let object = detailsObject{
            titleLable.text = object.name
            imageView.imageFromServerURL(urlString: object.industry!)
            webView.loadRequest(NSURLRequest(url: NSURL(string: detailsObject.objectId!) as! URL) as URLRequest)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
