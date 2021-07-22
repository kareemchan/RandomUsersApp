//
//  RandomUsersAPI.swift
//  RandomUsers
//
//  Created by Kareem Giuseppe Chanfreau Estrella on 19/07/21.
//

import Foundation

class RandomUsersAPI {
  
  class func getRandomUsers(page: Int, completion: @escaping ([UserModel]?, String?) -> Void) {
    APIService.request(url: String(format: RandomUsersURLs.users.rawValue, page)) { (jsonArray, errorMessage) in
      if let error = errorMessage {
        completion(nil, error)
      }
      if let jsonArray = jsonArray {
        let array = Utilities.getModelDataFromJSON(data: jsonArray)
        completion(array, nil)
      }
    }
  }
}
