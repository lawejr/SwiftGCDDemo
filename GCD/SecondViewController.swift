//
//  SecondViewController.swift
//  GCD
//
//  Created by Aleksandr Kalinin on 28.03.17.
//  Copyright © 2017 Aleksandr Kalinin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
  @IBOutlet weak var imageView: UIImageView!
  
  var imageURL: NSURL?
  var image: UIImage? {
    get { return imageView.image }
    set {
      imageView.image = newValue
      imageView.sizeToFit()
    }
  }
  
  func fetchImage() {
    imageURL = NSURL(string: "http://luxfon.com/images/201203/luxfon.com_4994.jpg")
    
    if let url = imageURL {
      print("if 1")
      print(url)
      let imageData = NSData(contentsOf: url as URL)
      if imageData != nil {
        print("if 2")

        self.image = UIImage(data: imageData! as Data)
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    fetchImage()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
