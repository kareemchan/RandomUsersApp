//
//  RandomUserDetailsViewModel.swift
//  RandomUsers
//
//  Created by Kareem Giuseppe Chanfreau Estrella on 21/07/21.
//

import Foundation

class RandomUserDetailsViewModel {
  
  var user = UserModel()
  let items = [UsersItems.name, UsersItems.email, UsersItems.gender, UsersItems.phone]
  
  var userName: String {
    return "\(user.name?.firstName ?? "") \(user.name?.lastName ?? "")"
  }
  
  var itemsNum: Int {
    return items.count
  }
  
  var address: String {
    return "\(user.location?.street ?? ""), \(user.location?.city ?? ""), \(user.location?.state ?? ""), \(user.location?.postcode ?? "")"
  }
  
  func selectedItem(index: Int) -> (String, String){
    let title = items[index]
    switch title {
    case .name:
      return (title.rawValue, "\(user.name?.firstName ?? "") \(user.name?.lastName ?? "")")
    case .email:
      return (title.rawValue, user.email)
    case .gender:
      return (title.rawValue, setGenderNomenclature(gender: user.gender))
    case .phone:
      return (title.rawValue, user.phone)
    }
  }
  
  func setGenderNomenclature(gender: String) -> String {
    if gender == "male" {
      return Genders.male.rawValue
    } else if gender == "female" {
      return Genders.female.rawValue
    }
    return ""
  }
}
