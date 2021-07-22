//
//  Enums.swift
//  RandomUsers
//
//  Created by Kareem Giuseppe Chanfreau Estrella on 19/07/21.
//

import Foundation

enum RandomUsersURLs: String {
  case users = "https://randomuser.me/api/?page=%d&results=10&seed=abc"
}

enum UsersItems: String {
  case name = "Nombre"
  case email = "Email"
  case gender = "Género"
  case phone = "Teléfono"
}
