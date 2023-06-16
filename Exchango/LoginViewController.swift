//
//  LoginViewController.swift
//  Exchango
//
//  Created by Natasha Machado on 2023-06-06.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {
  
  @IBOutlet var EmailField: UITextField!
  @IBOutlet var PasswordField: UITextField!
  @IBOutlet var LoginButton: UIButton!
  @IBOutlet var ForgotPasswordButton: UIButton!
  @IBOutlet var SignUpButton: UIButton!
  @IBOutlet var GoogleButton: UIButton!
  @IBOutlet var AppleButton: UIButton!
  @IBOutlet var FacebookButton: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func appleButtonPressed(_ sender: Any) {
    openAppleLogin()
  }
  
  @IBAction func googleButtonPressed(_ sender: Any) {
    openGoogleLoginPage()
  }
  
  @IBAction func facebookButtonPressed(_ sender: Any) {
    openFacebookLoginPage()
  }
  
  
  
  func openGoogleLoginPage() {
    if let url = URL(string: "https://accounts.google.com") {
      let safariViewController = SFSafariViewController(url: url)
      safariViewController.modalPresentationStyle = .popover
      present(safariViewController, animated: true, completion: nil)
    }
  }
  
  func openFacebookLoginPage() {
    if let url = URL(string: "https://www.facebook.com") {
      let safariViewController = SFSafariViewController(url: url)
      safariViewController.modalPresentationStyle = .popover
      present(safariViewController, animated: true, completion: nil)
    }
  }
  
  func openAppleLogin() {
    if let url = URL(string: "https://appleid.apple.com/sign-in") {
      let safariViewController = SFSafariViewController(url: url)
      safariViewController.modalPresentationStyle = .popover
      present(safariViewController, animated: true, completion: nil)
      
    }
  }
}

