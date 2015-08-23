//
//  UserDetailViewController.swift
//  GitHubClient
//
//  Created by Matthew McClure on 8/23/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
  
  var selectedUser : User! 

  @IBOutlet weak var selectedUserImage: UIImageView!
  @IBOutlet weak var selectedUserNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        println(selectedUser.login)
        // Do any additional setup after loading the view.
      selectedUserImage.image = selectedUser.userImage
      selectedUserNameLabel.text = selectedUser.login
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
