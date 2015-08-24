//
//  UserSearchViewController.swift
//  GitHubClient
//
//  Created by Matthew McClure on 8/19/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

import UIKit

class UserSearchViewController: UIViewController {
  
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var collectionView: UICollectionView!
  
  let imageQueue = NSOperationQueue()
  
  var userSearchResults = [User]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.dataSource = self
    searchBar.delegate = self
    println(view.frame)
    if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
      //flowLayout.itemSize = CGSize(width: view.frame.width/4, height: view.frame.width/4)
      let marginSize = view.frame.width/20
      let cellWidth = (0.8 * (view.frame.width))/3
      let cellHeight = view.frame.height/5
      flowLayout.sectionInset = UIEdgeInsets(top: marginSize, left: marginSize, bottom: marginSize, right: marginSize)
      flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
    }
    
  }
  
  override func viewDidAppear(animated: Bool) {
    collectionView.reloadData()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  

  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let destination = segue.destinationViewController as? UserDetailViewController,
      indexPath = collectionView.indexPathsForSelectedItems().first as? NSIndexPath {
        let user = userSearchResults[indexPath.row]
        destination.selectedUser = user
    }
  }
}

//MARK: - UICollectionViewDataSource
extension UserSearchViewController: UICollectionViewDataSource {
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return userSearchResults.count
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("UserCell", forIndexPath: indexPath) as! UserCell
//    let collectionViewWidth = self.collectionView.bounds.size.width
//    cell.frame.size.width = collectionViewWidth/3

    cell.avatarImageView.image = nil
    cell.tag++
    let tag = cell.tag
    var user = userSearchResults[indexPath.row]
    
    cell.userNameLabel.text = user.login
    
    if let image = user.userImage {
      cell.avatarImageView.image = image
    } else {
      
      ImageService.fetchProfileImage(user.avatarURL, imageQueue: imageQueue, completionHandler: { (image) -> () in
        user.userImage = image
        self.userSearchResults[indexPath.row] = user
        if cell.tag == tag {
          cell.avatarImageView.image = user.userImage
          //cell.avatarImageView.frame.width =
          //          UIView.animateWithDuration(0.3, animations: { () -> Void in
          //            cell.alpha = 1
          //          })
        }
      })
    }
    
    return cell
  }
  
  
}

//MARK: - UISearchBarDelegate
extension UserSearchViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    GitHubService.usersForSearchTerm(searchBar.text, completionHandler: { (error, users) -> (Void) in
      
      if let error = error {
        //handle error
      } else {
        self.userSearchResults = users!
        
        self.collectionView.reloadData()
      }
    })
  }
  
  func searchBar(searchBar: UISearchBar, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
    
    return text.validateStringForURL()
    
  }
}
