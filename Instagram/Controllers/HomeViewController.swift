//
//  HomeViewController.swift
//  Instagram
//
//  Created by Ari Supriatna on 21/03/21.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    handleNotAuthenticated()
  }
  
  private func handleNotAuthenticated() {
    // MARK: Check auth status
    if Auth.auth().currentUser == nil {
      let loginVC = LoginViewController()
      loginVC.modalPresentationStyle = .fullScreen
      
      present(loginVC, animated: true, completion: nil)
    }
  }
}

