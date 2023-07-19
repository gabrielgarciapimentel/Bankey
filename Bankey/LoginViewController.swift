//
//  ViewController.swift
//  Bankey
//
//  Created by Gabriel Garcia Pimentel Mendonca on 18/07/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let loginView = LoginView()
    let buttonSignIn = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        style()
        layout()
    }
}

extension LoginViewController {
    private func style() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.text = "Bankey"
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.numberOfLines = 2
        subtitleLabel.text = "Your premium source for all things banking!"
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        buttonSignIn.translatesAutoresizingMaskIntoConstraints = false
        buttonSignIn.configuration = .tinted()
        buttonSignIn.configuration?.imagePadding = 8
        buttonSignIn.setTitle("Sign In", for: [])
        buttonSignIn.addTarget(self, action: #selector(handleSignIn), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = false
    }
    
    private func layout() {
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(loginView)
        view.addSubview(buttonSignIn)
        view.addSubview(errorMessageLabel)
        
        // Title
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
            titleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor)
        ])
        
        // Subtitle
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 3),
            subtitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 2)
        ])
        
        
        NSLayoutConstraint.activate([
            buttonSignIn.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            buttonSignIn.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            buttonSignIn.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: buttonSignIn.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: buttonSignIn.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: buttonSignIn.trailingAnchor)
        ])
    }
}


extension LoginViewController {
    @IBAction func handleSignIn(_ sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / password cannot be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            setError(withMessage: "Username / password cannot be blank")
            return
        }
        
        if username == "Gabriel" || password == "123456" {
            buttonSignIn.configuration?.showsActivityIndicator = true
            return
        }
        
        setError(withMessage: "Incorrect username / password")
        return
    }
    
    private func setError(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
