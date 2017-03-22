//
//  DetailViewController.swift
//  Baboon
//
//  Created by Amir Daliri on 3/22/17.
//  Copyright © 2017 Baboon. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailTextLabel: UILabel?

    var detailText: String? {
        didSet {
            reloadData()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
    }

    func reloadData() {
        if !isViewLoaded {
            return
        }

        detailTextLabel?.text = detailText
    }
}

