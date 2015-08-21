//
//  UserJSONParser.swift
//  GitHubClient
//
//  Created by Matthew McClure on 8/20/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

import Foundation

class UserJSONParser {
  class func usersFromJSONData(jsonData: NSData) -> [User]? {
    
    var error : NSError?
    var users = [User]()
    
    if let rootObject = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &error) as? [String : AnyObject] {
      
      if let items = rootObject["items"] as? [[String : AnyObject]] {
        for item in items {
          if let login = item["login"] as? String, avatarURL = item["avatar_url"] as? String, id = item["id"] as? Int {
            let user = User(login: login, avatarURL: avatarURL, id: id, userImage: nil) 
            users.append(user)
          }
        }
      }
    }
    return users
  }
}