//
//  WebViewController.swift
//  GitHubClient
//
//  Created by Matthew McClure on 8/23/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
  
  var passedURL: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      let webView = WKWebView(frame: view.frame)
      view.addSubview(webView)
      
      let urlRequest = NSURLRequest(URL: NSURL(string: passedURL)!)
      webView.loadRequest(urlRequest)
      //webView.loadRequest(urlRequest)
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
