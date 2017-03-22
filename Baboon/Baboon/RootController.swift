//
//  RootController.swift
//  Baboon
//
//  Created by Amir Daliri on 3/22/17.
//  Copyright © 2017 Baboon. All rights reserved.
//


import UIKit
import MXMSideMenuController

class RootController: SideMenuController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let menu = storyboard?.instantiateViewController(withIdentifier: "Menu") as? MenuViewController {
      menu.delegate = self
      menuViewController = menu
    }
  }
}


