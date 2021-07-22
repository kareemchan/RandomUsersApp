//
//  RandomUserDetailsViewController.swift
//  RandomUsers
//
//  Created by Kareem Giuseppe Chanfreau Estrella on 20/07/21.
//

import UIKit
import MapKit
import SDWebImage

class RandomUserDetailsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  @IBOutlet weak var pictureImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var mapView: MKMapView!
  
  //MARK:- Properties
  let viewModel = RandomUserDetailsViewModel()
  
  //MARK:- App Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  //MARK:- Class Methods
  private func setupView() {
    self.title = viewModel.userName
    addMarker()
    collectionView.dataSource = self
    collectionView.delegate = self
    titleLabel.text = viewModel.items[0].rawValue
    descriptionLabel.text = viewModel.userName
    pictureImageView.clipsToBounds = true
    pictureImageView.layer.cornerRadius = 0.5 * pictureImageView.bounds.size.width
    if let url = URL(string: viewModel.user.picture) {
      pictureImageView.sd_setImage(with: url, placeholderImage: UIImage(named: ""))
    }
  }
  
  private func addMarker() {
    let latitude = CLLocationDegrees(Float(viewModel.user.location?.coordinates?.latitude ?? "") ?? 0.0)
    let longitude = CLLocationDegrees(Float(viewModel.user.location?.coordinates?.longitude ?? "") ?? 0.0)
    let initialLocation = CLLocation(latitude: latitude, longitude: longitude)
    mapView.centerToLocation(initialLocation)
    let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    let marker = LocationMarker(name: viewModel.userName, locationName: viewModel.address, coordinate: coordinates)
    mapView.addAnnotation(marker)
  }
  
  //MARK:- Collection View Delegate Methods
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    viewModel.itemsNum
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userDetailsCell", for: indexPath) as? UserDetailsCollectionViewCell else {
      return UICollectionViewCell()
    }
    cell.configure(item: viewModel.items[indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    (titleLabel.text, descriptionLabel.text) = viewModel.selectedItem(index: indexPath.row)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 172.0, height: 80.0)
  }

}
