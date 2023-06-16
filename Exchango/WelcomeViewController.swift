//
//  WelcomeViewController.swift
//  Exchango
//
//  Created by Natasha Machado on 2023-06-06.
//

import UIKit

class WelcomeViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
      self.fadeToNextScreen()
    }
  }
  
  func fadeToNextScreen() {
    UIView.animate(withDuration: 0.5, animations: {
      self.view.alpha = 0
    }) { (_) in
      self.performSegue(withIdentifier: "LoginSegue", sender: nil)
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "LoginSegue" {
      if segue.destination is LoginViewController {
      }
    }
  }
}
