//
//  MenuItemCell.swift
//  Baboon
//
//  Created by Amir Daliri on 3/22/17.
//  Copyright © 2017 Baboon. All rights reserved.
//


import UIKit

class MenuItemCell: UITableViewCell {

  @IBOutlet weak var menuItemCell: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
}
