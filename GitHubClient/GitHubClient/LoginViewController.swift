//
//  LoginViewController.swift
//  GitHubClient
//
//  Created by Matthew McClure on 8/18/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  @IBAction func loginButtonPressed(sender: UIButton) {
    if let token = KeychainService.loadToken() {
    } else {
      AuthService.performInitialRequest()
    }
  }
  
  @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
      
      NSNotificationCenter.defaultCenter().addObserver(self, selector: "newToken", name: kTokenNotification, object: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
  }
  
  func newToken() {
    performSegueWithIdentifier("presentMainMenu", sender: nil)
  }
  
  deinit {
    NSNotificationCenter.defaultCenter().removeObserver(self, name: kTokenNotification, object: nil)
  }
  
}
