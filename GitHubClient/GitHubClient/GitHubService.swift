//
//  GitHubService.swift
//  GitHubClient
//
//  Created by Matthew McClure on 8/17/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

import Foundation

class GitHubService {
  
  class func repositoriesForSearchTerm(searchTerm : String, completionHandler: (String?, [Repo]?) -> (Void)) {
    let baseURL = "http://localhost:3000"
    let finalURL = baseURL + "?q=\(searchTerm)"
    if let url = NSURL(string: finalURL) {
      NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
        if let error = error {
          println("error")
        } else if let httpResponse = response as? NSHTTPURLResponse {
          println(httpResponse)
          switch httpResponse.statusCode {
          case 200...299:
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
              let repos = RepoJSONParser.reposFromJSONData(data)
              completionHandler(nil, repos)
            })
          case 400...499:
            println("it's our fault")
            completionHandler("it's our fault", nil)
          case 500...599:
            println("it's the server's fault")
            completionHandler("it's the server's fault", nil)
          default:
            println("error occurred")
          }
        }
        completionHandler("There was an issue with the response", nil)
      }).resume()
    }
  }
}