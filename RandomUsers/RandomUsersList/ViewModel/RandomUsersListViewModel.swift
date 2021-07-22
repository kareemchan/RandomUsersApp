//
//  RandomUsersListViewModel.swift
//  RandomUsers
//
//  Created by Kareem Giuseppe Chanfreau Estrella on 20/07/21.
//

import Foundation

class RandomUsersListViewModel {
  
  var users: [UserModel] = []
  var currentUser = UserModel()
  var delegate: RandomUsersListDelegate?
  private var currentPage = 1
  var isFetchInProgress = false
  
  var usersNum: Int {
    return users.count
  }
  
  func getRandomUsers() {
    isFetchInProgress = true
    RandomUsersAPI.getRandomUsers(page: currentPage) { (users, error) in
      if let error = error {
        self.delegate?.handleError(error: error)
        return
      }
      if let users = users {
        self.currentPage += 1
        self.users.append(contentsOf: users)
        self.isFetchInProgress = false
        self.delegate?.showRandomUsersList()
      }
    }
  }
}
