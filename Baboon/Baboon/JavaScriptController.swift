//
//  HtmlCssViewController.swift
//  Baboon
//
//  Created by Amir Daliri on 4/14/17.
//  Copyright © 2017 Baboon. All rights reserved.
//

import UIKit

class JavaScriptController: UIViewController {

  @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      webView.loadRequest(URLRequest(url: URL(string: Strings.js)!))
//      self.view.backgroundColor = UIColor.white
      self.navigationController?.navigationBar.barTintColor = UIColor.navbar

    }
  
  @IBAction func menuTapped(_ sender: Any) {
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.drawerController?.toggle(.left, animated: true, completion: nil)
  }
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
