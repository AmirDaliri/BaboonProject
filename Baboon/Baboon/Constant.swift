//
//  Constant.swift
//  Baboon
//
//  Created by Amir Daliri on 3/21/17.
//  Copyright © 2017 Baboon. All rights reserved.
//

import Foundation
import UIKit


struct Constants {
  
  struct Cache {
    static let imageCache = NSCache<AnyObject, AnyObject>()
  }
  
  
  struct ApiConstants {
    
    #if DEBUG
    static let baseURLString = "http://baboon.ir/wp-json/givekesh"
    #else
    static let baseURLString = "http://baboon.ir/wp-json/givekesh"
    #endif
    
    static let giphyApiKey = "http://baboon.ir/wp-json/givekesh"
    
  }
  
  struct UserDefaults {
    static let auth = ""
    static let phone = ""
    static let token = ""
    static let hasTappedNotificationPermission = ""
    static let hasSeenIntro = ""
    static let isUser = ""
    static let userId = ""
    static let choosedClubId = ""
    static let membershipNumber = ""
    static let renewalDate = ""
    static let adderes = ""
    static let dob = ""
    static let name = ""
  }
  
  public func mediumDate(_ apiDate: String) -> String {
    // Reformat date String
    let dateFormatter: DateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    var checkInDate: Date? = Date()
    checkInDate = dateFormatter.date(from: apiDate)
    
    if let date = checkInDate {
      let checkInFormat: DateFormatter = DateFormatter()
      checkInFormat.dateStyle = DateFormatter.Style.medium
      return "\(checkInFormat.string(from: date))"
    }
    return ""
  }
}
