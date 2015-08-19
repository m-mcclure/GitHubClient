//
//  AuthService.swift
//  GitHubClient
//
//  Created by Matthew McClure on 8/18/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

import UIKit

class AuthService {
  class func performInitialRequest() {
    UIApplication.sharedApplication().openURL(NSURL(string: "https://github.com/login/oauth/authorize?client_id=\(kClientID)&redirect_uri=GitHubCient://oauth&scope=user,repo")!)
  }
  /*
  class func exchangeCodeInURL(codeURL : NSURL) {
    let code = codeURL.query {
      let request = NSMutableURLRequest(URL: NSURL(string: "https://github.com/login/oauth/access_token?\(code)&client_id=\(kClientID)&client_secret=\(kClientSecret)")!)
      println(request.URL)
      request.HTTPMethod = "POST"
      NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
        if let httpResponse = response as? NSHTTPURLResponse {
          println(httpResponse.statusCode)
          
          var jsonError : NSError?
          
          if let rootObject = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? [String : AnyObject], token = rootObject["access_token"] as? String {
            println(token)
          }
            
        }
      }).resume()
    }
  }*/
}