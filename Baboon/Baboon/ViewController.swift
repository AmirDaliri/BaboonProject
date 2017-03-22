//
//  ViewController.swift
//  Baboon
//
//  Created by Amir Daliri on 3/21/17.
//  Copyright © 2017 Baboon. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // I'm Here...
    
    getTestResponse()
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
}

