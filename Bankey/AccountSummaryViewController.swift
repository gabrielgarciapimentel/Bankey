//
//  AccountSummaryViewController.swift
//  Bankey
//
//  Created by Gabriel Garcia Pimentel Mendonca on 14/08/23.
//

import UIKit

class AccountSummaryViewController: UIViewController {
    
    var tableView = UITableView()
    let games = [
        "Pacman",
        "Space Invaders",
        "Space Patrol"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}


extension AccountSummaryViewController {
    func setup() {
        setupTableView()
    }
    
    func setupTableView() {
        // Manage the table view functionalities
        tableView.delegate = self
        
        // Manage the table view data
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = games[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
}

extension AccountSummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
