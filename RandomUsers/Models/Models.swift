//
//  UserModel.swift
//  RandomUsers
//
//  Created by Kareem Giuseppe Chanfreau Estrella on 19/07/21.
//

import Foundation
import ObjectMapper
import MapKit

struct GeneralData: Mappable {
  
  var users: [UserModel] = []
  
  init?(map: Map) {
    
  }
  
  mutating func mapping(map: Map) {
    users <- map["results"]
  }
  
}

struct UserModel: Mappable {
  
  var id = ""
  var gender = ""
  var name: UserNameModel?
  var email = ""
  var phone = ""
  var picture = ""
  var location: LocationModel?
  
  init?(map: Map) {
    
  }
  
  init() {
    
  }
  
  mutating func mapping(map: Map) {
    id <- map["id.value"]
    gender <- map["gender"]
    name <- map["name"]
    email <- map["email"]
    phone <- map["phone"]
    picture <- map["picture.medium"]
    location <- map["location"]
  }
  
  
}

struct UserNameModel: Mappable {
  
  var title = ""
  var firstName = ""
  var lastName = ""
  
  init?(map: Map) {
    
  }
  
  mutating func mapping(map: Map) {
    title <- map["title"]
    firstName <- map["first"]
    lastName <- map["last"]
  }
  
}

struct LocationModel: Mappable {
  
  var street = ""
  var city = ""
  var state = ""
  var postcode = ""
  var coordinates: CoordinatesModel?
  
  init?(map: Map) {
    
  }
  
  mutating func mapping(map: Map) {
    street <- map["street"]
    city <- map["city"]
    state <- map["state"]
    postcode <- map["postcode"]
    coordinates <- map["coordinates"]
  }
  
  
}

struct CoordinatesModel: Mappable {
  
  var latitude = ""
  var longitude = ""
  
  init?(map: Map) {
    
  }
  
  mutating func mapping(map: Map) {
    latitude <- map["latitude"]
    longitude <- map["longitude"]
  }
  
}

class LocationMarker: NSObject, MKAnnotation {
   
  let name: String?
  let locationName: String?
  let coordinate: CLLocationCoordinate2D

  init(name: String?, locationName: String?, coordinate: CLLocationCoordinate2D) {
    self.name = name
    self.locationName = locationName
    self.coordinate = coordinate
  }

  var subtitle: String? {
    return "latitude: \(Float(coordinate.latitude)), longitude \(Float(coordinate.longitude))"
  }
  
  var title: String? {
    return locationName
  }
  
}
