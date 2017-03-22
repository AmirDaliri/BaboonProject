//
//  MenuViewController.swift
//  Baboon
//
//  Created by Amir Daliri on 3/22/17.
//  Copyright © 2017 Baboon. All rights reserved.
//


import UIKit

protocol MenuViewControllerDelegate: class {
  
  func menuViewController(_ menuViewController: MenuViewController, didSelectMenuItem menuItem: MenuItem)
}

class MenuViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView?
  
  weak var delegate: MenuViewControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    _setActiveMenuItemAtIndex(0)
    _reloadData()
  }
  
  fileprivate let _menuItems = [
    MenuItem(title: "HTML/ CSS", viewControllerId: "Preferences"),
    MenuItem(title: "JavaScript", viewControllerId: "Navigation"),
    MenuItem(title: "Node.js", viewControllerId: "Preferences"),
    MenuItem(title: "AngularJS", viewControllerId: "Preferences"),
    MenuItem(title: "Vagrant", viewControllerId: "Preferences"),
    MenuItem(title: "Laravel", viewControllerId: "Preferences"),
    MenuItem(title: "jQuery", viewControllerId: "Preferences"),
    MenuItem(title: "PHP", viewControllerId: "Preferences"),
    MenuItem(title: "Bootstrap", viewControllerId: "Preferences"),
    MenuItem(title: "Ruby on Rails", viewControllerId: "Preferences"),
    MenuItem(title: "Express", viewControllerId: "Preferences"),
    MenuItem(title: "Symfony", viewControllerId: "Preferences"),

    ]
  
  fileprivate func _setActiveMenuItemAtIndex(_ index: Int) {
    _setActiveMenuItem(_menuItems[index])
  }
  
  fileprivate func _setActiveMenuItem(_ menuItem: MenuItem) {
    delegate?.menuViewController(self, didSelectMenuItem: menuItem)
  }
  
  fileprivate func _reloadData() {
    
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
}

extension MenuViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return _menuItems.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemCell", for: indexPath) as! MenuItemCell
    cell.item = _menuItems[indexPath.row]
    return cell
  }
}

extension MenuViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    _setActiveMenuItemAtIndex(indexPath.row)
  }
}
