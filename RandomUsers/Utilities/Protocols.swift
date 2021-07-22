//
//  Protocols.swift
//  RandomUsers
//
//  Created by Kareem Giuseppe Chanfreau Estrella on 20/07/21.
//

import Foundation

protocol RandomUsersListDelegate {
  func showRandomUsersList()
  func handleError(error: String)
}
