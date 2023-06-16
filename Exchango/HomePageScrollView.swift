//
//  HomePageScrollView.swift
//  Exchango
//
//  Created by Natasha Machado on 2023-06-15.
//

import UIKit

class HomePageScrollView: UIScrollView {
  private let stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = 10
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupScrollView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupScrollView()
  }
  
  private func setupScrollView() {
    addSubview(stackView)
    NSLayoutConstraint.activate([
      stackView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
      stackView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
      stackView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor),
      stackView.widthAnchor.constraint(equalTo: widthAnchor)
    ])
  }
}



