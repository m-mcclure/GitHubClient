//
//  RepoSearchViewController.swift
//  GitHubClient
//
//  Created by Matthew McClure on 8/17/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

import UIKit

class RepoSearchViewController: UIViewController {
  
  @IBOutlet weak var searchBar: UISearchBar!
  
  @IBOutlet weak var tableView: UITableView!

  var repoSearchResults = [Repo]()

    override func viewDidLoad() {
        super.viewDidLoad()
      tableView.dataSource = self
      tableView.delegate = self
        searchBar.delegate = self
        // Do any additional setup after loading the view.
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  override func viewWillAppear(animated: Bool) {
    tableView.reloadData()
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

//MARK: - UISearchBarDelegate
extension RepoSearchViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    GitHubService.repositoriesForSearchTerm(searchBar.text, completionHandler: { (error, repos) -> (Void) in
      
      if let error = error {
        //handle error
      } else {
        self.repoSearchResults = repos!
        println("there are \(self.repoSearchResults.count) here")
        self.tableView.reloadData()
      }
    })
  }
}

//MARK: - 
extension RepoSearchViewController: UITableViewDataSource {
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return repoSearchResults.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("repoCell", forIndexPath: indexPath) as! RepoCell
    
    cell.repoNameLabel.text = repoSearchResults[indexPath.row].repoName
    cell.languageLabel.text = repoSearchResults[indexPath.row].language
    cell.descriptionLabel.text = repoSearchResults[indexPath.row].repoDescription
    cell.createdAtLabel.text = repoSearchResults[indexPath.row].createdAt
    cell.updatedAtLabel.text = repoSearchResults[indexPath.row].updatedAt
    cell.createdByLabel.text = repoSearchResults[indexPath.row].ownerLogin
    
    return cell
  }
  
}

//MARK: - 
extension RepoSearchViewController: UITableViewDelegate {
  
}
