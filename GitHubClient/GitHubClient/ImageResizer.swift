// Borrowed from Josh Nagel:
//  ImageResizer.swift
//  GitHubToGo
//
//  Created by Josh Nagel on 4/14/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

import UIKit

class ImageResizer {
  
  class func resizeImage(image: UIImage, size: CGSize) -> UIImage {
    UIGraphicsBeginImageContext(size)
    image.drawInRect(CGRect(x: 0, y: 0, width: size.width, height: size.height))
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return newImage
  }
}