//
//  NewsFeedViewController.swift
//  framework
//
//  Created by apple on 02/05/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import MBProgressHUD

class NewsFeedTableViewCell: UITableViewCell {

    @IBOutlet var titleLable: UILabel!
    @IBOutlet var detailsImageView: UIImageView!
    @IBOutlet var dateLable: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
class NewsFeedViewController: UIViewController, ShowsAlert {
    var objectsArray:[NewsFeed] = [NewsFeed]()
    let searchController = UISearchController(searchResultsController: nil)
    var filteredArray = [NewsFeed]()
    var refreshControl: UIRefreshControl!

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh), for: UIControlEvents.valueChanged)
        self.tableView.addSubview(refreshControl)
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        
        self.refresView(deleteAction: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func refresh(sender:AnyObject) {
        //  your code to refresh tableView
        NewsFeed.truncateAllObjects(context: GlobalVariables.managedObjectContext)
        self.refresView(deleteAction: false)
    }
    @IBAction func deleteButtonClick(_ sender: Any) {
        
        NewsFeed.truncateAllObjects(context: GlobalVariables.managedObjectContext)
        self.refresView(deleteAction: true)

    }
    func refresView(deleteAction:Bool){
        
        objectsArray = NewsFeed.fetchAllObjects(context: GlobalVariables.managedObjectContext) as! [NewsFeed]
        
        if objectsArray.count == 0 && !deleteAction {
            self.getNewsFeedServiceCall()
        }
        
        self.tableView.reloadData()
    }
    //MARK:Service Calls
    func getNewsFeedServiceCall(){
        
        let paramsDictionary:[String:String] = ["method": GlobalVariables.RequestAPIMethods.getNewsFeed.rawValue as String,"source":"techcrunch","apiKey":GlobalVariables.apiKey]
        MBProgressHUD.showAdded(to: self.view, animated: true)
        NetworkManager.request(type: GlobalVariables.RequestAPIType.GET, parameters: paramsDictionary as [String : AnyObject], delegate: self)
    }
    
    func filterContentForSearchText(searchText: String) {
        filteredArray = objectsArray.filter({( object : NewsFeed) -> Bool in
            return (object.name?.lowercased().contains(searchText.lowercased()))!
        })
        self.refresView(deleteAction: false)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "NewsListToNewsDetailsSegue"{
            let indexPath = self.tableView.indexPathForSelectedRow
            let destingationViewController:NewsDetailsViewController = segue.destination as! NewsDetailsViewController
            destingationViewController.detailsObject = self.objectsArray[(indexPath?.row)!]
            
        }
    }
}
extension NewsFeedViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredArray.count
        }
        return objectsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:NewsFeedTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsFeedTableViewCell
        
        
        let object:NewsFeed!
        if searchController.isActive && searchController.searchBar.text != "" {
            object  = filteredArray[indexPath.row]
        }else{
            object  = objectsArray[indexPath.row]
            
        }
        cell.titleLable?.text = object.name
        cell.dateLable?.text =  GlobalSettings.getStringFromDate(date:object.releaseDate!)
        cell.detailsImageView.imageFromServerURL(urlString: object.industry!)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "NewsListToNewsDetailsSegue", sender: self)
    }
}
// MARK: - Response Handling
extension NewsFeedViewController:NetworkDelegate{
    func dataDelegate(reponseData: AnyObject, requestMethod: String) {
        switch requestMethod{
        case GlobalVariables.RequestAPIMethods.getNewsFeed.rawValue as String as String :
            guard let rootDictionary = reponseData as? [String:AnyObject] else{
                return
            }
            guard let resultArray:[AnyObject] = rootDictionary["articles"] as? [AnyObject] else {
                return
            }
            //Insert all records to core data
            DispatchQueue.global(qos: .userInitiated).async { // 1
                for dictionary in resultArray{
                    NewsFeed.insertObject(dictionary: dictionary as! [String:String], context:GlobalVariables.managedObjectContext)
                }
                DispatchQueue.main.async { // 2
                    
                    self.refreshControl.endRefreshing()
                    MBProgressHUD.hide(for: self.view, animated: true)
                    self.refresView(deleteAction: false)
                }
            }
            break
        default:
            print("")
        
        }
    }
    func networkError(errorMessage: String) {
        MBProgressHUD.hide(for: self.view, animated: true)
        self.showAlert(message: errorMessage)
        
    }
}
extension NewsFeedViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchText: searchBar.text!)
    }
}

extension NewsFeedViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        // code here
        filterContentForSearchText(searchText: searchController.searchBar.text!)

    }
 }
