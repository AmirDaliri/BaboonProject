//
//  LoadingController.swift
//  Baboon
//
//  Created by Amir Daliri on 3/21/17.
//  Copyright © 2017 Baboon. All rights reserved.
//

import UIKit
import MMDrawerController


class LoadingController: UIViewController {
  
  var drawerController: MMDrawerController?

  @IBOutlet weak var loadingIconView: UIImageView!
  
  let showFeedIdentifier = "showPostList"
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // I'm Here...
    drawerController = self.mm_drawerController

    self.rotateLoading()
    self.setupLoader()
  }
  
  
  
  private func setupLoader() {
    perform(#selector(self.showFeed), with: nil, afterDelay: 5)
    self.navigationController?.navigationBar.isHidden = true
  }
  
  func showFeed() {
    performSegue(withIdentifier: self.showFeedIdentifier, sender: self)
  }
  
  func rotateLoading() {
    UIView.animate(withDuration: 0.9, delay: 0, options: .curveLinear, animations: {
      self.loadingIconView!.transform = self.loadingIconView!.transform.rotated(by: CGFloat(Double.pi))
    }, completion: { finished in
      self.rotateLoading()
    })
  }
  
  @IBAction func menuTapped(_ sender: Any) {
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.drawerController?.toggle(.left, animated: true, completion: nil)
  }
  
}

