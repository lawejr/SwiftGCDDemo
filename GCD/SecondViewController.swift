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
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  var imageURL: NSURL?
  var image: UIImage? {
    get { return imageView.image }
    set {
      imageView.image = newValue
      imageView.sizeToFit()
      self.activityIndicator.stopAnimating()
      self.activityIndicator.isHidden = true
    }
  }
  
  func fetchImage() {
    imageURL = NSURL(string: "http://luxfon.com/images/201203/luxfon.com_4994.jpg")
    
    if let url = imageURL {
      self.activityIndicator.startAnimating()
      
      DispatchQueue.global().async {
        let imageData = NSData(contentsOf: url as URL)
        DispatchQueue.main.async {
          if imageData != nil {
            self.image = UIImage(data: imageData! as Data)
          } else {
            self.image = nil
          }
        }
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    fetchImage()
    // Отложенный вызов кода через 5 сек
    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { 
      let ac = UIAlertController(title: "Зарегистрированы?", message: "Введите логин и пароль", preferredStyle: .alert)
      let ok = UIAlertAction(title: "ОК", style: .default, handler: nil)
      let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
      
      ac.addAction(ok)
      ac.addAction(cancel)
      ac.addTextField { (usernameField) in
        usernameField.placeholder = "Ваш логин"
      }
      ac.addTextField { (passwordField) in
        passwordField.placeholder = "Ваш пароль"
        passwordField.isSecureTextEntry = true
      }
      
      self.present(ac, animated: true, completion: nil)
    }
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
