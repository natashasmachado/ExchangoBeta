//
//  SignUpViewController.swift
//  Exchango
//
//  Created by Natasha Machado on 2023-06-20.
//

import UIKit

class SignUpViewController: UIViewController {

  
  @IBOutlet var FirstName: UITextField!
  @IBOutlet var LastName: UITextField!
  @IBOutlet var Username: UITextField!
  @IBOutlet var Email: UITextField!
  @IBOutlet var DateOfBirth: UIDatePicker!
  @IBOutlet var Password: UITextField!
  @IBOutlet var SignUpCompleteButton: UIButton!
  
  weak var delegate: SignUpDelegate?

  
  @IBAction func signUpButtonPressed(_ sender: UIButton) {
      guard let name = Username.text, let email = Email.text else {
          return
      }
      delegate?.didSignUp(withName: name, email: email)
      dismiss(animated: true, completion: nil)
  }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
protocol SignUpDelegate: AnyObject {
    func didSignUp(withName name: String, email: String)
}
