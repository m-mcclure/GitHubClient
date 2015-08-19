//
//  Repo.swift
//  GitHubClient
//
//  Created by Matthew McClure on 8/18/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

import Foundation

struct Repo {
  let repoName : String
  let ownerLogin : String
  let ownerAvatarURL : String?
  let ownerGravatarID : String
  let repoDescription : String
  let createdAt : String
  let updatedAt : String
  let language : String 
}