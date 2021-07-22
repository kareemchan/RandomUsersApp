//
//  APIService.swift
//  RandomUsers
//
//  Created by Kareem Giuseppe Chanfreau Estrella on 19/07/21.
//

import Foundation

class APIService {
    
  static let defaultSession = URLSession(configuration: .default)
  static var dataTask: URLSessionDataTask?
  static var errorMessage = ""
        
  class func request(url: String, completion: @escaping (Data?, String?) -> Void) {
    dataTask?.cancel()
        
    guard let url = URL(string: url) else {
      return
    }
        
    dataTask = defaultSession.dataTask(with: url) { data, response, error in
      defer {
        self.dataTask = nil
      }
      
      guard let httpResponse = response as? HTTPURLResponse, httpResponse.hasSuccessStatusCode else {
        DispatchQueue.main.async {
          self.errorMessage = "Uh oh, something has gone wrong. Please tweet us @randomapi about the issue. Thank you."
          completion(nil, errorMessage)
        }
        return
      }
      if let error = error {
        DispatchQueue.main.async {
          self.errorMessage = "DataTask error: " + error.localizedDescription + "\n"
          completion(nil, errorMessage)
        }
      } else if let data = data {
        DispatchQueue.main.async {
          completion(data, nil)
        }
      }
    }
    dataTask?.resume()
  }
}

extension HTTPURLResponse {
  var hasSuccessStatusCode: Bool {
    return 200...299 ~= statusCode
  }
}
