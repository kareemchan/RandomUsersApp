//
//  Extensions.swift
//  RandomUsers
//
//  Created by Kareem Giuseppe Chanfreau Estrella on 21/07/21.
//

import Foundation
import MapKit

extension MKMapView {
  func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
    let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
