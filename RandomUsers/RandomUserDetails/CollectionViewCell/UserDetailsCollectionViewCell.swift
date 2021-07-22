//
//  UserDetailsCollectionViewCell.swift
//  RandomUsers
//
//  Created by Kareem Giuseppe Chanfreau Estrella on 20/07/21.
//

import UIKit

class UserDetailsCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var mainView: UIView!
  @IBOutlet weak var iconImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    self.mainView.layer.cornerRadius = 15
    self.mainView.layer.shadowColor = UIColor.black.cgColor
    self.mainView.layer.shadowOpacity = 0.16
    self.mainView.layer.shadowOffset = .zero
    self.mainView.layer.shadowRadius = 15
    self.mainView.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
  }
  
  func configure(item: UsersItems) {
    titleLabel.text = item.rawValue
    var imageName = ""
    switch item {
    case .name:
      imageName = "name"
    case .email:
      imageName = "email"
    case .gender:
      imageName = "gender"
    case .phone:
      imageName = "phone"
    }
    iconImageView.image = UIImage(named: "\(imageName)_icon")
  }
  
}
