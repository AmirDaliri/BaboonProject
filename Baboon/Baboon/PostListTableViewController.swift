//
//  PostListViewController.swift
//  Baboon
//
//  Created by Amir Daliri on 3/22/17.
//  Copyright © 2017 Baboon. All rights reserved.
//


import UIKit

class PostListTableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
  
  var searchController = UISearchController(searchResultsController: nil)
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //I'm Here...
    
    self.headerSetup()
  }
  
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    self.dismiss(animated: true, completion: nil)
  }
  func updateSearchResults(for searchController: UISearchController) {
    
    // code here
    
  }
  
  private func headerSetup() {
    
    self.tableView.rowHeight = UITableViewAutomaticDimension
    self.tableView.estimatedRowHeight = 44
    self.navigationController?.navigationBar.barTintColor = UIColor.navbar
    self.sideMenuController?.mode = .shiftMenu
    
    self.definesPresentationContext = true
    self.searchController.searchResultsUpdater = self
    self.searchController.hidesNavigationBarDuringPresentation = true
    self.searchController.dimsBackgroundDuringPresentation = false
    self.searchController.searchBar.sizeToFit()
    self.tableView.tableHeaderView = searchController.searchBar
    self.searchController.searchBar.barTintColor = UIColor.navbar
    self.searchController.searchBar.tintColor = UIColor.white
    
  }
  
}
