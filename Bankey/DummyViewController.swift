//
//  DummyViewController.swift
//  Bankey
//
//  Created by Gabriel Garcia Pimentel Mendonca on 03/08/23.
//

import UIKit

class DummyViewController: UIViewController {
    let stackContainer = UIStackView()
    let titleLabel = UILabel()
    let logoutButton = UIButton(type: .system)
    
    weak var delegate: LogoutDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        style()
        layout()
    }
}

extension DummyViewController {
    func style() {
        stackContainer.translatesAutoresizingMaskIntoConstraints = false;
        stackContainer.axis = .vertical
        stackContainer.spacing = 8
        
        titleLabel.text = "Welcome to DummyView"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.addTarget(self, action: #selector(handleLogout), for: .primaryActionTriggered)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        stackContainer.addArrangedSubview(titleLabel)
        stackContainer.addArrangedSubview(logoutButton)
        
        view.addSubview(stackContainer)
        
        NSLayoutConstraint.activate([
            stackContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

extension DummyViewController {
    @objc func handleLogout(sender: UIButton) {
        delegate?.didLogout()
    }
}
