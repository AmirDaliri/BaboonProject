//
//  AppDelegate.swift
//  Baboon
//
//  Created by Amir Daliri on 3/21/17.
//  Copyright © 2017 Baboon. All rights reserved.
//

import UIKit
import XCGLogger
import MMDrawerController

// TODO: Fix coloring
let log: XCGLogger = {
  let log = XCGLogger.default
  log.setup(level: .debug, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true, writeToFile: nil, fileLevel: .debug)
  
  
  return log
}()


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {
  
  var window: UIWindow?
  var drawerController: MMDrawerController?

  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    
    
    UIApplication.shared.statusBarStyle = .lightContent

    
    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let centerViewController = mainStoryboard.instantiateViewController(withIdentifier: "LoadingController") as! LoadingController
    let leftViewController = mainStoryboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
    let leftNav = UINavigationController(rootViewController: leftViewController)
    let centerNav = UINavigationController(rootViewController: centerViewController)
    drawerController = MMDrawerController(center: centerNav, leftDrawerViewController: leftNav)
    
    drawerController?.openDrawerGestureModeMask = MMOpenDrawerGestureMode.all
    drawerController!.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.all;
    //    drawerController!.showsShadow = true
    drawerController!.setMaximumLeftDrawerWidth(180, animated: true, completion: nil)
    
    window!.rootViewController = drawerController
    window!.makeKeyAndVisible()
    return true
  }

  
}

