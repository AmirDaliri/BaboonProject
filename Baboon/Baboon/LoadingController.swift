//
//  LoadingController.swift
//  Baboon
//
//  Created by Amir Daliri on 3/21/17.
//  Copyright © 2017 Baboon. All rights reserved.
//

import UIKit
import Alamofire
import UICircularProgressRing

class LoadingController: UIViewController, UICircularProgressRingDelegate {
  
  @IBOutlet weak var loadingRing: UICircularProgressRingView!

  override func viewDidLoad() {
    super.viewDidLoad()
    // I'm Here...
    
    getTestResponse()
    
    //Loading Automat Compelet
    loadingRing.delegate = self
    loadingRing.animationStyle = kCAMediaTimingFunctionLinear
    loadingRing.setProgress(value: 0, animationDuration: 0) { [unowned self] in
      self.loadingRing.viewStyle = 2
      self.loadingRing.setProgress(value: 100, animationDuration: 5) {}
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  private func getTestResponse() {
    Alamofire.request(ApiRouter.Router.login()).validate().responseJSON() {
      (response) in
      print(response)
    }
  }
  
  func finishedUpdatingProgress(forRing ring: UICircularProgressRingView) {
    if ring == loadingRing {
      print("")
    }
  }
}

