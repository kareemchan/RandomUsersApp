//
//  Utilities.swift
//  RandomUsers
//
//  Created by Kareem Giuseppe Chanfreau Estrella on 20/07/21.
//

import UIKit

class Utilities {
  
  //MARK:- Alert View
  static func showErrorAlertView(title: String, message: String, vc: UIViewController) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
    vc.present(alert, animated: true)
  }
  
  //MARK:- JSON Parsing Methods
  class func getModelDataFromJSON(data: Data) -> [UserModel] {
    var response: [String: Any]?
    var users: [UserModel] = []
    do {
      response = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
    } catch _ as NSError {
      return users
    }
    
    if let data = GeneralData(JSON: response ?? [:]) {
      users = data.users
    }
    return users
  }
}
