//
//  MenuItemCell.swift
//  Baboon
//
//  Created by Amir Daliri on 3/22/17.
//  Copyright © 2017 Baboon. All rights reserved.
//


import UIKit

class MenuItemCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel?

    var item: MenuItem? {
        didSet {
            _reloadData()
        }
    }

    private func _reloadData() {
        titleLabel?.text = item?.title
    }
}
