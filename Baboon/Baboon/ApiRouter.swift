//
//  ApiRouter.swift
//  Baboon
//
//  Created by Amir Daliri on 3/21/17.
//  Copyright © 2017 Baboon. All rights reserved.
//

import Foundation
import Alamofire



enum BackendError: Error {
  case network(error: Error) // Capture any underlying Error from the URLSession API
  case dataSerialization(error: Error)
  case jsonSerialization(error: Error)
  case xmlSerialization(error: Error)
  case objectSerialization(reason: String)
}

public protocol ResponseCollectionSerializable {
  static func collection(from response: HTTPURLResponse, withRepresentation representation: Any) -> [Self]
}

public protocol ResponseObjectSerializable {
  init?(response: HTTPURLResponse, representation: Any)
}

extension ResponseCollectionSerializable where Self: ResponseObjectSerializable {
  static func collection(from response: HTTPURLResponse, withRepresentation representation: Any) -> [Self] {
    var collection: [Self] = []
    
    if let representation = representation as? [[String: Any]] {
      for itemRepresentation in representation {
        if let item = Self(response: response, representation: itemRepresentation) {
          collection.append(item)
        }
      }
    }
    
    return collection
  }
}


extension DataRequest {
  @discardableResult
  public func responseObject<T: ResponseObjectSerializable>(
    _ queue: DispatchQueue? = nil,
    completionHandler: @escaping (DataResponse<T>) -> Void)
    -> Self {
      let responseSerializer = DataResponseSerializer<T> { request, response, data, error in
        guard error == nil else { return .failure(BackendError.network(error: error!)) }
        
        let jsonResponseSerializer = DataRequest.jsonResponseSerializer(options: .allowFragments)
        let result = jsonResponseSerializer.serializeResponse(request, response, data, nil)
        
        guard case let .success(jsonObject) = result else {
          return .failure(BackendError.jsonSerialization(error: result.error!))
        }
        
        guard let response = response, let responseObject = T(response: response, representation: jsonObject) else {
          return .failure(BackendError.objectSerialization(reason: "JSON could not be serialized: \(jsonObject)"))
        }
        
        return .success(responseObject)
      }
      
      return response(responseSerializer: responseSerializer, completionHandler: completionHandler)
  }
  
  @discardableResult
  func responseCollection<T: ResponseCollectionSerializable>(
    _ queue: DispatchQueue? = nil,
    completionHandler: @escaping (DataResponse<[T]>) -> Void) -> Self {
    let responseSerializer = DataResponseSerializer<[T]> { request, response, data, error in
      guard error == nil else { return .failure(BackendError.network(error: error!)) }
      
      let jsonSerializer = DataRequest.jsonResponseSerializer(options: .allowFragments)
      let result = jsonSerializer.serializeResponse(request, response, data, nil)
      
      guard case let .success(jsonObject) = result else {
        return .failure(BackendError.jsonSerialization(error: result.error!))
      }
      
      guard let response = response else {
        let reason = "Response collection could not be serialized due to nil response."
        return .failure(BackendError.objectSerialization(reason: reason))
      }
      
      return .success(T.collection(from: response, withRepresentation: jsonObject))
    }
    
    return response(responseSerializer: responseSerializer, completionHandler: completionHandler)
  }
}

struct ApiRouter {
  enum Router: URLRequestConvertible {
    case checkMobileExistence(mobile: String)
    case generatePin(mobile: String)
    case verifyPin(mobile: String, pin: String)
    case searchClub(query: String)
    case signUp(mobile: String, name: String, dob: String)
    case accuireMembership(membershipNumber: String, renewalDate: String, clubKey: String)
    case mainFeed()
    case cardFeed(id: String)
    case getAnnouncement(id: String)
    case userProfile(userId: String)
    case login()
    case myProfile()
    case updateProfile()
    
    
    
    var method: Alamofire.HTTPMethod {
      switch self {
      case .generatePin:
        return .post
      case .checkMobileExistence:
        return .get
      case .verifyPin:
        return .post
      case .searchClub:
        return .get
      case .signUp:
        return .post
      case .accuireMembership:
        return .post
      case .mainFeed:
        return .get
      case .userProfile:
        return .get
      case .login:
        return .get
      case .cardFeed:
        return .get
      case .getAnnouncement:
        return .get
      case .myProfile:
        return .get
      case .updateProfile:
        return .put
      }
    }
    
    func asURLRequest() throws -> URLRequest {
      let result: (path: String, parameters: [String: AnyObject]?) = {
        switch self {
        case .checkMobileExistence(let mobile):
          return ("/users/\(mobile)/registered", nil)
        case .generatePin(let mobile):
          let params: [String: AnyObject] = ["mobile": mobile as AnyObject]
          return ("/users/pin/generate", params)
        case .verifyPin(let mobile, let pin):
          let params: [String: AnyObject] = ["mobile": mobile as AnyObject, "pin": pin as AnyObject]
          return ("/users/pin/verify", params)
        case .searchClub(let query):
          let params = ["q": query]
          return ("/clubs", params as [String : AnyObject]?)
        case .signUp(let mobile, let name, let dob):
          let params: [String: AnyObject] = ["mobile": mobile as AnyObject, "name": name as AnyObject, "dob": dob as AnyObject]
          return ("/users/signup", params)
        case .accuireMembership(let membershipNumber, let renewalDate, let clubKey):
          let params: [String: AnyObject] = ["membershipNumber": membershipNumber as AnyObject, "renewalDate": renewalDate as AnyObject, "clubKey": clubKey as AnyObject]
          return ("/members/acquire", params)
        case .mainFeed():
          return ("/feeds/me", nil)
        case .cardFeed(let id):
          return ("/feeds/\(id)", nil)
        case .getAnnouncement(let id):
          return ("/announcements/\(id)", nil)
        case .userProfile( _):
          return ("",nil)
        case .login():
//          let params = ["mobile": User.getUserPhone()!, "auth": User.getUserAuth()!]
//          return("/posts", params as [String : AnyObject]?)
          return("/posts", nil)
        case .myProfile():
          return("/users/me", nil)
        case .updateProfile():
          let params = ["name": User.getUserName()!, "address": User.getUserAddress()!, "dob": User.getDob()!]
          return("/users/me", params as [String : AnyObject]?)
        }
      }()
      
      let url = URL(string: Constants.ApiConstants.baseURLString)!
      var urlRequest = URLRequest(url: url.appendingPathComponent(result.path))
      urlRequest.httpMethod = method.rawValue
      
      if let token = User.getToken() {
        urlRequest.setValue(token, forHTTPHeaderField: "Authorization")
      }
      
      let encoding = try Alamofire.URLEncoding.default.encode(urlRequest, with: result.parameters)
      return encoding
    }
  }
}

