//
//  RepoJSONParser.swift
//  GitHubClient
//
//  Created by Matthew McClure on 8/18/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

import Foundation

class RepoJSONParser {
  class func reposFromJSONData(jsonData : NSData) -> [Repo]? {
    
    var error : NSError?
    var repos = [Repo]()
    
    if let rootObject = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &error) as? [String : AnyObject] {
      
      if let items = rootObject["items"] as? [[String : AnyObject]] {
        for item in items {
          if let repoName = item["name"] as? String, owner = item["owner"] as? [String : AnyObject], ownerLogin = owner["login"] as? String, ownerAvatarURL = owner["avatar_url"] as? String, repoDescription = item["description"] as? String, createdAt = item["created_at"] as? String, updatedAt = item["updated_at"] as? String, language = item["language"] as? String, htmlURL = item["html_url"] as? String {
            
            let repo = Repo(repoName: repoName, ownerLogin: ownerLogin, ownerAvatarURL: ownerAvatarURL, repoDescription: repoDescription, createdAt: createdAt, updatedAt: updatedAt, language: language, htmlURL: htmlURL)
            repos.append(repo)
            println(repos.count)
          }
        }
      }
    }
    for repo in repos {
      println(repo.repoName)
    }
    return repos
  }
  
  
}