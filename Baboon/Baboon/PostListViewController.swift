//
//  PostListViewController.swift
//  Baboon
//
//  Created by Amir Daliri on 3/22/17.
//  Copyright © 2017 Baboon. All rights reserved.
//


import UIKit

class PostListViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate {
  
  @IBOutlet weak var webview: UIWebView!
  
  var searchController = UISearchController(searchResultsController: nil)
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //I'm Here...
    webview.loadRequest(URLRequest(url: URL(string: Strings.mainPage)!))

    self.headerSetup()
    self.navigationController?.navigationBar.isHidden = false
    self.navigationController?.navigationBar.barTintColor = UIColor.navbar

  }

  @IBAction func menuTapped(_ sender: Any) {
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.drawerController?.toggle(.left, animated: true, completion: nil)
  }


  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    self.dismiss(animated: true, completion: nil)
  }
  func updateSearchResults(for searchController: UISearchController) {
    
    // code here
    
  }
  
  private func headerSetup() {
    
//    self.tableView.rowHeight = UITableViewAutomaticDimension
//    self.tableView.estimatedRowHeight = 44
    self.navigationController?.navigationBar.barTintColor = UIColor.navbar
    
    self.definesPresentationContext = true
    self.searchController.searchResultsUpdater = self
    self.searchController.hidesNavigationBarDuringPresentation = true
    self.searchController.dimsBackgroundDuringPresentation = false
    self.searchController.searchBar.sizeToFit()
//    self.tableView.tableHeaderView = searchController.searchBar
    self.searchController.searchBar.barTintColor = UIColor.navbar
    self.searchController.searchBar.tintColor = UIColor.white
    
  }
  
}

//let data = NSData(contentsOf: NSURL(string: "http://baboon.ir/wp-json/givekesh/posts") as! URL)
//let doc = TFHpple(htmlData: data as Data!)
//
//if let elements = doc?.search(withXPathQuery: ("//p")) as? [TFHppleElement] {
//  for element in elements {
//    print("------")
//    print(element.content)
//  }
//}
