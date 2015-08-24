//
//  Extensions.swift
//  GitHubClient
//
//  Created by Matthew McClure on 8/23/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

import Foundation

extension String {
  func validateStringForURL() -> Bool {
    
    var error: NSError?
    
    if let regex = NSRegularExpression(pattern: "[^0-9a-zA-Z\n]", options: nil, error: &error) {
      let matches = regex.numberOfMatchesInString(self, options: nil, range: NSRange(location: 0, length: count(self)))
      
      return matches > 0 ? false : true
    }
    return true 
  }
}