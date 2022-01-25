//
//  ViewController.swift
//  MyBank
//
//  Created by Prashant Gaikwad on 25/01/22.
//

import UIKit

class LogInViewController: UIViewController {

    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorLabel = UILabel()
    
    var username: String? {
        return loginView.usernameTF.text
    }
    
    var password: String? {
        return loginView.passwordTF.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        style()
        layout()
    }


}

extension LogInViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8.0
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .primaryActionTriggered)
        
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.textAlignment = .center
        errorLabel.textColor = .systemRed
        errorLabel.isHidden = true
    }
    
    private func layout() {
        
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorLabel)
        
        NSLayoutConstraint.activate([
            // LoginView
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            
            // SigninButton
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            
            // errorLabel
            errorLabel.topAnchor.constraint(equalToSystemSpacingBelow:signInButton.bottomAnchor, multiplier: 2),
            errorLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor)
        ])
    }
}

// MARK: - Actions
extension LogInViewController {
    @objc func signInButtonTapped() {
        errorLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / Password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / Password cannot be blank")
            return
        }
        
        if username == "Prashant" && password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect Username / Password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorLabel.isHidden = false
        errorLabel.text = message
    }
}
