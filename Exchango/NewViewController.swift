//
//  NewViewController.swift
//  Exchango
//
//  Created by Natasha Machado on 2023-06-14.
//

import UIKit

class NewViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
  
  
  @IBOutlet var AddPhotosButton: UIButton!
  @IBOutlet var AddDescriptionButton: UIButton!
  @IBOutlet var AddAvailabilityButton: UIButton!
  @IBOutlet var ConfirmIdButton: UIButton!
  @IBOutlet var UsernameLabel: UILabel!
  @IBOutlet var collectionView: UICollectionView!
  @IBOutlet var descriptionLabel: UILabel!
  
  
  
  var username: String?
  var availabilityLabel: UILabel!
  var selectedImages: [UIImage] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    UsernameLabel?.text = username
    collectionView?.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCollectionViewCell")
    collectionView?.dataSource = self
    collectionView?.delegate = self
    AddPhotosButton?.addTarget(self, action: #selector(addPhotosButtonPressed), for: .touchUpInside)
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
      selectedImages.append(image)
      collectionView?.reloadData()
      if selectedImages.count > 0 {
        AddPhotosButton.isHidden = true
      }
    }
    picker.dismiss(animated: true, completion: nil)
  }
  
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
}

extension NewViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return selectedImages.count
  }
  
  
  @IBAction func addAvailabilityButtonPressed(_ sender: UIButton) {
    let datePicker = UIDatePicker()
    datePicker.datePickerMode = .date
    datePicker.minimumDate = Date()
    datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
    let alertController = UIAlertController(title: "Select Date", message: nil, preferredStyle: .actionSheet)
    alertController.view.addSubview(datePicker)
    let doneAction = UIAlertAction(title: "Done", style: .default) { [weak self] _ in
      self?.showAvailabilityLabel()
    }
    alertController.addAction(doneAction)
    present(alertController, animated: true, completion: nil)
  }
  
  @objc func datePickerValueChanged(_ sender: UIDatePicker) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM dd, yyyy"
    let selectedDate = dateFormatter.string(from: sender.date)
    availabilityLabel?.text = selectedDate
  }
  
  private func showAvailabilityLabel() {
    availabilityLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    availabilityLabel.center = view.center
    availabilityLabel.textAlignment = .center
    availabilityLabel.textColor = .white
    view.addSubview(availabilityLabel)
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
    let image = selectedImages[indexPath.item]
    cell.imageView.image = image
    return cell
  }
  
  @IBAction func addDescriptionButtonPressed(_ sender: UIButton) {
    showDescriptionAlert()
  }
  
  private func showDescriptionAlert() {
    let alertController = UIAlertController(title: "Add Description", message: nil, preferredStyle: .alert)
    alertController.addTextField { textField in
      textField.placeholder = "Enter description:"
    }
    
    let addAction = UIAlertAction(title: "Done", style: .default) { [weak self] _ in
      guard let textField = alertController.textFields?.first,
            let description = textField.text else {
        return
      }
      self?.updateDescriptionLabel(description)
    }
    
    alertController.addAction(addAction)
    present(alertController, animated: true, completion: nil)
  }
  
  private func updateDescriptionLabel(_ description: String) {
    descriptionLabel?.text = description
    descriptionLabel?.isHidden = false
    
    let descriptionTextLabel = UILabel()
    descriptionTextLabel.text = description
    descriptionTextLabel.font = UIFont(name: "Thonburi", size: 20)
    descriptionTextLabel.textColor = .white
    descriptionTextLabel.numberOfLines = 0
    descriptionTextLabel.translatesAutoresizingMaskIntoConstraints = false

    view.addSubview(descriptionTextLabel)
    NSLayoutConstraint.activate([
      descriptionTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      descriptionTextLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
    ])
    AddDescriptionButton.isHidden = true
    
  }
  
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    guard let textFieldText = textField.text else { return true }
    let newLength = textFieldText.count + string.count - range.length
    return newLength <= 200
  }
}




