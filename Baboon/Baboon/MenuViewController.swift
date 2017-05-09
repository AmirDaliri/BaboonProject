//
//  MenuViewController.swift
//  Baboon
//
//  Created by Amir Daliri on 3/22/17.
//  Copyright © 2017 Baboon. All rights reserved.
//


import UIKit


class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  
  var menuItem: [String] = ["صفحه اصلی", "JavaScript", "Node.js", "Express", "AngularJS", "Bootstrap", "PHP", "Symfony", "Laravel", "Ruby on Rails", "Vagrant"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.isHidden = true
    tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0)
  }

  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menuItem.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuItemCell
    cell.menuItemCell.text = menuItem[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //HtmlCssViewController
    switch (indexPath.row) {
    case 0:
      let centerViewController = self.storyboard?.instantiateViewController(withIdentifier: "PostListViewController") as! PostListViewController
      let centerNavController = UINavigationController(rootViewController: centerViewController)
      let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
      
      appDelegate.drawerController?.centerViewController = centerNavController
      appDelegate.drawerController?.toggle(.left, animated: true, completion: nil)

    case 1:
      let SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "JavaScriptController") as! JavaScriptController
      let SignUpNavController = UINavigationController(rootViewController: SignUpViewController)
      let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
      
      appDelegate.drawerController?.centerViewController = SignUpNavController
      appDelegate.drawerController?.toggle(.left, animated: true, completion: nil)
      
    case 2:
      let node = self.storyboard?.instantiateViewController(withIdentifier: "Node") as! Node
      let nodeNav = UINavigationController(rootViewController: node)
      let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
      
      appDelegate.drawerController?.centerViewController = nodeNav
      appDelegate.drawerController?.toggle(.left, animated: true, completion: nil)
      
    case 3:
      let SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "Express") as! Express
      let SignUpNavController = UINavigationController(rootViewController: SignUpViewController)
      let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
      
      appDelegate.drawerController?.centerViewController = SignUpNavController
      appDelegate.drawerController?.toggle(.left, animated: true, completion: nil)
      
    case 4:
      let SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "AngularJS") as! AngularJS
      let SignUpNavController = UINavigationController(rootViewController: SignUpViewController)
      let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
      
      appDelegate.drawerController?.centerViewController = SignUpNavController
      appDelegate.drawerController?.toggle(.left, animated: true, completion: nil)
      
    case 5:
      let SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "Bootstrap") as! Bootstrap
      let SignUpNavController = UINavigationController(rootViewController: SignUpViewController)
      let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
      
      appDelegate.drawerController?.centerViewController = SignUpNavController
      appDelegate.drawerController?.toggle(.left, animated: true, completion: nil)
      
    case 6:
      let SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "PHP") as! PHP
      let SignUpNavController = UINavigationController(rootViewController: SignUpViewController)
      let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
      
      appDelegate.drawerController?.centerViewController = SignUpNavController
      appDelegate.drawerController?.toggle(.left, animated: true, completion: nil)
      
    case 7:
      let SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "Symfony") as! Symfony
      let SignUpNavController = UINavigationController(rootViewController: SignUpViewController)
      let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
      
      appDelegate.drawerController?.centerViewController = SignUpNavController
      appDelegate.drawerController?.toggle(.left, animated: true, completion: nil)
      
    case 8:
      let SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "Laravel") as! Laravel
      let SignUpNavController = UINavigationController(rootViewController: SignUpViewController)
      let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
      
      appDelegate.drawerController?.centerViewController = SignUpNavController
      appDelegate.drawerController?.toggle(.left, animated: true, completion: nil)
      
    case 9:
      let SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "RubyOnRails") as! RubyOnRails
      let SignUpNavController = UINavigationController(rootViewController: SignUpViewController)
      let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
      
      appDelegate.drawerController?.centerViewController = SignUpNavController
      appDelegate.drawerController?.toggle(.left, animated: true, completion: nil)
      
    case 10:
      let SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "Vagrant") as! Vagrant
      let SignUpNavController = UINavigationController(rootViewController: SignUpViewController)
      let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
      
      appDelegate.drawerController?.centerViewController = SignUpNavController
      appDelegate.drawerController?.toggle(.left, animated: true, completion: nil)
      
    default:
      print("not working")
    }
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
}












