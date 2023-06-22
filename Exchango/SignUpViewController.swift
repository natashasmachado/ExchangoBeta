//
//  SignUpViewController.swift
//  Exchango
//
//  Created by Natasha Machado on 2023-06-20.
//

import UIKit

class SignUpViewController: UIViewController, SignUpDelegate {
  
  
  @IBOutlet var FirstName: UITextField!
  @IBOutlet var LastName: UITextField!
  @IBOutlet var Username: UITextField!
  @IBOutlet var Email: UITextField!
  @IBOutlet var DateOfBirth: UIDatePicker!
  @IBOutlet var Password: UITextField!
  @IBOutlet var SignUpCompleteButton: UIButton!
  @IBOutlet var CancelButton: UIButton!
  
  var delegate: SignUpDelegate?
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "NewViewControllerSegue" {
      if let newViewController = segue.destination as? NewViewController {
        newViewController.username = Username.text
      }
    }
  }
  
  func didSignUp(withName name: String, email: String) {
    performSegue(withIdentifier: "NewViewControllerSegue", sender: self)
  }
  
  
  @IBAction func signUpButtonPressed(_ sender: UIButton) {
    if FirstName.text?.isEmpty == true || LastName.text?.isEmpty == true || Username.text?.isEmpty == true || Email.text?.isEmpty == true || Password.text?.isEmpty == true {
      let alert = UIAlertController(title: "Incomplete Information", message: "Please complete all fields before signing up.", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
      present(alert, animated: true, completion: nil)
    } else {
      guard let name = Username.text, let email = Email.text else {
        return
      }
      delegate?.didSignUp(withName: name, email: email)
      let newViewController = NewViewController()
      newViewController.username = Username.text
      navigationController?.pushViewController(newViewController, animated: true)
    }
  }
  
  
  @IBAction func cancelButtonPressed(_ sender: UIButton) {
    navigateToLoginViewController()
  }
  
  private func navigateToLoginViewController() {
    if let loginViewController = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
      present(loginViewController, animated: true, completion: nil)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    delegate = self
  }
}


protocol SignUpDelegate: AnyObject {
  func didSignUp(withName name: String, email: String)
}
