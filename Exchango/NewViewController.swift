//
//  NewViewController.swift
//  Exchango
//
//  Created by Natasha Machado on 2023-06-14.
//

import UIKit

class NewViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @IBOutlet var AddPhotosButton: UIButton!
  @IBOutlet var AddDescriptionButton: UIButton!
  @IBOutlet var AddAvailabilityButton: UIButton!
  @IBOutlet var ConfirmIdButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    AddPhotosButton.addTarget(self, action: #selector(addPhotosButtonPressed), for: .touchUpInside)
    
  }
  
  @objc func addPhotosButtonPressed() {
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    
    let alertController = UIAlertController(title: "Add Photos", message: nil, preferredStyle: .actionSheet)
    
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
      let takePhotoAction = UIAlertAction(title: "Take Photo", style: .default) { _ in
        imagePicker.sourceType = .camera
        self.present(imagePicker, animated: true, completion: nil)
      }
      alertController.addAction(takePhotoAction)
    }
    
    let choosePhotoAction = UIAlertAction(title: "Choose from Library", style: .default) { _ in
      imagePicker.sourceType = .photoLibrary
      self.present(imagePicker, animated: true, completion: nil)
    }
    alertController.addAction(choosePhotoAction)
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    alertController.addAction(cancelAction)
    
    present(alertController, animated: true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
    if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      // Handle the selected image
      // You can save or display the image as needed
    }
    
    picker.dismiss(animated: true, completion: nil)
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
}

