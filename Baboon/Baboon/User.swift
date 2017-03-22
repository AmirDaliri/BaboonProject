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
  var mobileNumber: Int?
  var dob: String?
  var membershipNumber: Bool?
  var renewalDate: [String]?
  
  
  init(auth: String, id: String, verificationProgress: Float) {
    self.auth = auth
    self.id = id
  }
  
  required init?(response: HTTPURLResponse, representation: Any) {
    
    guard let data = (representation as AnyObject)["data"] as? [String: AnyObject] else {
      return
    }
    
    self.name = (data as AnyObject).value(forKeyPath: "name") as? String
    self.adderes = (data as AnyObject).value(forKeyPath: "address") as? String
    self.mobileNumber = (data as AnyObject).value(forKeyPath: "mobile") as? Int
    self.dob = (data as AnyObject).value(forKeyPath: "dob") as? String
    self.membershipNumber = (data as AnyObject).value(forKeyPath: "") as? Bool
    self.renewalDate = (data as AnyObject).value(forKeyPath: "") as? [String]
    
  }
  
  static func setUserName(name: String) {
    UserDefaults.standard.set(name, forKey: Constants.UserDefaults.name)
  }
  
  static func getUserName() -> String? {
    return UserDefaults.standard.object(forKey: Constants.UserDefaults.name) as? String
  }
  
  static func setUserAddress(_ address: String) {
    UserDefaults.standard.set(address, forKey: Constants.UserDefaults.adderes)
  }
  
  static func getUserAddress() -> String? {
    return UserDefaults.standard.object(forKey: Constants.UserDefaults.adderes) as? String
  }
  
  static func setUserPhone(_ phone: String) {
    UserDefaults.standard.set(phone, forKey: Constants.UserDefaults.phone)
  }
  
  static func getUserPhone() -> String? {
    return UserDefaults.standard.object(forKey: Constants.UserDefaults.phone) as? String
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
  
  static func setUserMembershipNumber(number: String) {
    UserDefaults.standard.set(number, forKey: Constants.UserDefaults.membershipNumber)
  }
  
  static func getUserMembershipNumbe() -> String? {
    return UserDefaults.standard.object(forKey: Constants.UserDefaults.membershipNumber) as? String
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
  
  static func setDob(_ dob: String) {
    UserDefaults.standard.set(dob, forKey: Constants.UserDefaults.dob)
  }
  
  static func getDob() -> String? {
    return  UserDefaults.standard.object(forKey: Constants.UserDefaults.dob) as? String
  }
  
  static func setRenewalDate(date: String) {
    UserDefaults.standard.set(date, forKey: Constants.UserDefaults.renewalDate)
  }
  
  static func getRenewalDate() -> String? {
    return  UserDefaults.standard.object(forKey: Constants.UserDefaults.renewalDate) as? String
  }
  
  static func setChoosenClubId(clubId: String) {
    UserDefaults.standard.set(clubId, forKey: Constants.UserDefaults.choosedClubId)
  }
  
  static func getChoosenClubId() -> String? {
    return  UserDefaults.standard.object(forKey: Constants.UserDefaults.choosedClubId) as? String
  }
  
  static func setIntroSeen(hasSeen: Bool) {
    UserDefaults.standard.set(hasSeen, forKey: Constants.UserDefaults.hasSeenIntro)
  }
  
  static func getIntroSeen() -> Bool {
    return UserDefaults.standard.bool(forKey: Constants.UserDefaults.hasSeenIntro)
  }
  
}
