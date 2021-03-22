//
//  LoginViewController.swift
//  Instagram
//
//  Created by Ari Supriatna on 21/03/21.
//

import UIKit
import SafariServices

struct Constant {
  static let cornerRadius: CGFloat = 8.0
}

class LoginViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupButtonTarget()
    setupTextFieldDelegate()
    addSubviews()

    view.backgroundColor = .systemBackground
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    // MARK: Assign frame
    headerView.frame = CGRect(
      x: 0.0,
      y: 0.0,
      width: view.width,
      height: view.height / 3.0
    )
    
    usernameEmailField.frame = CGRect(
      x: 24,
      y: headerView.bottom + 36,
      width: view.width - 48,
      height: 52.0
    )
    
    passwordField.frame = CGRect(
      x: 24,
      y: usernameEmailField.bottom + 16,
      width: view.width - 48,
      height: 52.0
    )
    
    loginButton.frame = CGRect(
      x: 24,
      y: passwordField.bottom + 16,
      width: view.width - 48,
      height: 52.0
    )
    
    createAccountButton.frame = CGRect(
      x: 24,
      y: loginButton.bottom + 16,
      width: view.width - 48,
      height: 52.0
    )
    
    termsButton.frame = CGRect(
      x: 10.0,
      y: view.height - view.safeAreaInsets.bottom - 100,
      width: view.width - 20,
      height: 50
    )
    
    privacyButton.frame = CGRect(
      x: 10.0,
      y: view.height - view.safeAreaInsets.bottom - 50,
      width: view.width - 20,
      height: 50
    )
    
    configureHeaderView()
  }
  
  private func setupTextFieldDelegate() {
    usernameEmailField.delegate = self
    passwordField.delegate = self
  }
  
  private func setupButtonTarget() {
    loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    createAccountButton.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
    termsButton.addTarget(self, action: #selector(didTapTermsButton), for: .touchUpInside)
    privacyButton.addTarget(self, action: #selector(didTapPrivacyButton), for: .touchUpInside)
  }
  
  private func configureHeaderView() {
    guard headerView.subviews.count == 1 else { return }
    
    guard let backgroundView = headerView.subviews.first else { return }
    
    backgroundView.frame = headerView.bounds
    
    // MARK: Add instagram logo
    let imageView = UIImageView(image: UIImage(named: "logo"))
    headerView.addSubview(imageView)
    imageView.contentMode = .scaleAspectFit
    imageView.frame = CGRect(
      x: headerView.width / 4.0,
      y: headerView.safeAreaInsets.top,
      width: headerView.width / 2.0,
      height: headerView.height - headerView.safeAreaInsets.top
    )
  }
  
  private func addSubviews() {
    view.addSubview(headerView)
    view.addSubview(usernameEmailField)
    view.addSubview(passwordField)
    view.addSubview(loginButton)
    view.addSubview(termsButton)
    view.addSubview(privacyButton)
    view.addSubview(createAccountButton)
  }
  
  private let usernameEmailField: UITextField = {
    let field = UITextField()
    field.placeholder = "Username or email"
    field.returnKeyType = .next
    field.leftViewMode = .always
    field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
    field.autocorrectionType = .no
    field.autocapitalizationType = .none
    field.layer.masksToBounds = true
    field.layer.cornerRadius = Constant.cornerRadius
    field.backgroundColor = .secondarySystemBackground
    
    return field
  }()
  
  private let passwordField: UITextField = {
    let field = UITextField()
    field.isSecureTextEntry = true
    field.placeholder = "Password"
    field.returnKeyType = .continue
    field.leftViewMode = .always
    field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
    field.autocorrectionType = .no
    field.autocapitalizationType = .none
    field.layer.masksToBounds = true
    field.layer.cornerRadius = Constant.cornerRadius
    field.backgroundColor = .secondarySystemBackground
    
    return field
  }()
  
  private let loginButton: UIButton = {
    let button = UIButton()
    button.setTitle("Login", for: .normal)
    button.layer.masksToBounds = true
    button.layer.cornerRadius = Constant.cornerRadius
    button.backgroundColor = .systemBlue
    button.setTitleColor(.white, for: .normal)

    return button
  }()
  
  private let termsButton: UIButton = {
    let button = UIButton()
    button.setTitle("Terms of Services", for: .normal)
    button.setTitleColor(.secondaryLabel, for: .normal)
    
    return button
  }()
  
  private let privacyButton: UIButton = {
    let button = UIButton()
    button.setTitle("Privacy Policy", for: .normal)
    button.setTitleColor(.secondaryLabel, for: .normal)
    
    return button
  }()
  
  private let createAccountButton: UIButton = {
    let button = UIButton()
    button.setTitle("New User? Create an Account", for: .normal)
    button.setTitleColor(.label, for: .normal)
    
    return button
  }()
  
  private let headerView: UIView = {
    let header = UIView()
    header.clipsToBounds = true
    
    let backgroundImageView = UIImageView(image: UIImage(named: "backgroundGradient"))
    header.addSubview(backgroundImageView)
    
    return header
  }()
  
  @objc private func didTapLoginButton() {
    usernameEmailField.resignFirstResponder()
    passwordField.resignFirstResponder()
    
    guard let usernameEmail = usernameEmailField.text, !usernameEmail.isEmpty,
          let password = passwordField.text, !password.isEmpty, password.count >= 8 else {
      return
    }
    
    // MARK: Login Functionality
  }
  
  @objc private func didTapTermsButton() {
    guard let url = URL(string: "https://help.instagram.com/581066165581870") else { return }
    
    let vc = SFSafariViewController(url: url)
    
    present(vc, animated: true, completion: nil)
  }
  
  @objc private func didTapPrivacyButton() {
    guard let url = URL(string: "https://help.instagram.com/519522125107875") else { return }
    
    let vc = SFSafariViewController(url: url)
    
    present(vc, animated: true, completion: nil)
  }
  
  @objc private func didTapCreateAccountButton() {}
}

extension LoginViewController: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {

    if textField == usernameEmailField {
      passwordField.becomeFirstResponder()
    } else if textField == passwordField {
      didTapLoginButton()
    }
    
    return true
  }
  
}
