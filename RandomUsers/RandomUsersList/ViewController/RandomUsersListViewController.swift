//
//  RandomUsersListViewController.swift
//  RandomUsers
//
//  Created by Kareem Giuseppe Chanfreau Estrella on 19/07/21.
//

import UIKit

class RandomUsersListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, RandomUsersListDelegate, UIScrollViewDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  
  //MARK:- Properties
  let viewModel = RandomUsersListViewModel()
  
  //MARK:- App Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    viewModel.getRandomUsers()
  }
  
  //MARK:- Class Methods
  private func setupView() {
    viewModel.delegate = self
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  // MARK: - Navigation
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
    if let vc = segue.destination as? RandomUserDetailsViewController {
      vc.viewModel.user = viewModel.currentUser
    }
  }
  
  //MARK:- Random Users List Delegate Methods
  func showRandomUsersList() {
    tableView.reloadData()
  }
  
  func handleError(error: String) {
    Utilities.showErrorAlertView(title: "Error", message: error, vc: self)
  }
  
  //MARK:- Table View Delegate Methods
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    viewModel.usersNum
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "UsersCell", for: indexPath) as? UsersTableViewCell else { return UITableViewCell() }
    cell.configure(user: viewModel.users[indexPath.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    viewModel.currentUser = viewModel.users[indexPath.row]
    performSegue(withIdentifier: "userDetails", sender: nil)
  }
  
  //MARK:- ScrollView Delegate Methods
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let postion = scrollView.contentOffset.y
    if postion > (tableView.contentSize.height - 50) - scrollView.frame.size.height {
      if !viewModel.isFetchInProgress {
        debugPrint("Fetch data")
        viewModel.getRandomUsers()
      }
    }
  }

}
