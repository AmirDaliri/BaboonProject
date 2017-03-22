//
//  MenuItem.swift
//  Baboon
//
//  Created by Amir Daliri on 3/22/17.
//  Copyright © 2017 Baboon. All rights reserved.
//


import Foundation

struct MenuItem {

    let title: String
    let viewControllerId: String

    init(title: String, viewControllerId: String) {
        self.title = title
        self.viewControllerId = viewControllerId
    }
}
