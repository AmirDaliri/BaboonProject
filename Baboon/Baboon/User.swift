//
//  User.swift
//  Baboon
//
//  Created by Amir Daliri on 3/21/17.
//  Copyright © 2017 Baboon. All rights reserved.
//

import Foundation
import UIKit




class User: NSObject, ResponseObjectSerializable {
  
  var auth: String?
  var id: String?
  var name: String?
  var adderes: String?
  
  
  init(auth: String, id: String, verificationProgress: Float) {
    self.auth = auth
    self.id = id
  }
  
  required init?(response: HTTPURLResponse, representation: Any) {
    
    guard let data = (representation as AnyObject)["data"] as? [String: AnyObject] else {
      return
    }
    
    self.name = (data as AnyObject).value(forKeyPath: "") as? String
    self.adderes = (data as AnyObject).value(forKeyPath: "") as? String
    
  }
  
  static func setUserName(name: String) {
    UserDefaults.standard.set(name, forKey: Constants.UserDefaults.name)
  }
  
  static func getUserName() -> String? {
    return UserDefaults.standard.object(forKey: Constants.UserDefaults.name) as? String
  }
  
  
  static func setUserAuth(_ auth: String) {
    UserDefaults.standard.set(auth, forKey: Constants.UserDefaults.auth)
  }
  
  static func getUserAuth() -> String? {
    return UserDefaults.standard.object(forKey: Constants.UserDefaults.auth) as? String
  }
  
  static func setUserId(id: String) {
    UserDefaults.standard.set(id, forKey: Constants.UserDefaults.userId)
  }
  
  static func getUserId() -> String? {
    return UserDefaults.standard.object(forKey: Constants.UserDefaults.userId) as? String
  }
  
  
  static func isUser() -> Bool {
    if getUserAuth() != nil {
      return true
    } else {
      return false
    }
  }
  
  static func setToken(token: String) {
    UserDefaults.standard.setValue(token, forKey: Constants.UserDefaults.token)
  }
  
  static func getToken() -> String? {
    return UserDefaults.standard.object(forKey: Constants.UserDefaults.token) as? String
  }
  
}
