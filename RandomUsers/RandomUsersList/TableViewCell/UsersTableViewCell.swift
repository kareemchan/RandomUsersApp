//
//  UsersTableViewCell.swift
//  RandomUsers
//
//  Created by Kareem Giuseppe Chanfreau Estrella on 19/07/21.
//

import UIKit
import SDWebImage

class UsersTableViewCell: UITableViewCell {

  @IBOutlet weak var userNameLabel: UILabel!
  @IBOutlet weak var userImageView: UIImageView!
  @IBOutlet weak var phoneLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func layoutSubviews() {
    userImageView.clipsToBounds = true
    userImageView.layer.cornerRadius = 0.5 * userImageView.bounds.size.width
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }
  
  func configure(user: UserModel) {
    if let url = URL(string: user.picture) {
      userImageView.sd_setImage(with: url, placeholderImage: UIImage(named: ""))
    }
    userNameLabel.text = "\(user.name?.title ?? "") \(user.name?.firstName ?? "") \(user.name?.lastName ?? "")"
    phoneLabel.text = user.phone
  }

}
