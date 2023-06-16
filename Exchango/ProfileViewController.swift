//
//  ProfileViewController.swift
//  Exchango
//
//  Created by Natasha Machado on 2023-06-05.
//

import UIKit

class ProfileViewController: UIViewController {
  
  
  @IBOutlet var ProfilePictureView: UIImageView!
  @IBOutlet var UserNameLabel: UILabel!
  @IBOutlet var MemberLabel: UILabel!
  @IBOutlet var MessagesView: UIView!
  @IBOutlet var WatchlistView: UIView!
  @IBOutlet var SavedView: UIView!
  @IBOutlet var RecentView: UIView!
  @IBOutlet var WalletView: UIView!
  @IBOutlet var HelpView: UIView!
  @IBOutlet var SettingsView: UIView!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let cornerRadius: CGFloat = 15.0
    let viewsToRound: [UIView] = [MessagesView, WatchlistView, SavedView, RecentView]
    
    for view in viewsToRound {
      view.layer.cornerRadius = cornerRadius
      view.clipsToBounds = true
    }
  }
  
  
}
