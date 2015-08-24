//
//  MyProfileViewController.swift
//  GitHubClient
//
//  Created by Matthew McClure on 8/23/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController {
  
  @IBOutlet weak var myProfileImage: UIImageView!
  
  @IBOutlet weak var myNameLabel: UILabel!
  
  @IBOutlet weak var myReposCountLabel: UILabel!
  
  @IBOutlet weak var myFollowersCountLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
