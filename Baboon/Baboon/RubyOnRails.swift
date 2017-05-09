//
//  Ruby on Rails.swift
//  Baboon
//
//  Created by Amir Daliri on 4/15/17.
//  Copyright © 2017 Baboon. All rights reserved.
//

import UIKit

class RubyOnRails: UIViewController {

  @IBOutlet weak var webview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      webview.loadRequest(URLRequest(url: URL(string: Strings.ruby)!))
      self.navigationController?.navigationBar.barTintColor = UIColor.navbar

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func menuTapped(_ sender: Any) {
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.drawerController?.toggle(.left, animated: true, completion: nil)
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
