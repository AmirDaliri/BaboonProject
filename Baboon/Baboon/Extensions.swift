//
//  Extensions.swift
//  Baboon
//
//  Created by Amir Daliri on 3/22/17.
//  Copyright © 2017 Baboon. All rights reserved.
//

import Foundation
import UIKit




extension RootController: MenuViewControllerDelegate {
  
  func menuViewController(_ menuViewController: MenuViewController, didSelectMenuItem menuItem: MenuItem) {
    contentViewController = storyboard?.instantiateViewController(withIdentifier: menuItem.viewControllerId)
    sideMenuController?.setMenuVisible(false, animated: true)
  }
}

