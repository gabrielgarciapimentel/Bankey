//
//  AccountSummaryCell.swift
//  Bankey
//
//  Created by Gabriel Garcia Pimentel Mendonca on 16/08/23.
//

import Foundation
import UIKit

class AccountSummaryCell: UITableViewCell {
    let typeLabel = UILabel()
    let underlineView = UIView()
    let nameLabel = UILabel()
    
    let balanceStackView = UIStackView()
    let balanceLabel = UILabel()
    let balanceAmountLabel = UILabel()
    let chevronImageView = UIImageView()
    
    static let reuseID = "AccountSummaryCell"
    static let rowHeight: CGFloat = 100
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountSummaryCell {
    private func setup() {
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        typeLabel.adjustsFontForContentSizeCategory = true
        
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        underlineView.backgroundColor = .systemBlue
        underlineView.layer.cornerRadius = 2
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        nameLabel.text = "Account name"
        
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.text = "Some balance"
        balanceLabel.textAlignment = .right
        balanceLabel.font = UIFont.preferredFont(forTextStyle: .body)
        
        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceAmountLabel.text = "$4,000.00"
        balanceAmountLabel.textAlignment = .right
        balanceAmountLabel.font = UIFont.preferredFont(forTextStyle: .body)
        
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "chevron.right")!.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
        chevronImageView.image = image
        
        balanceStackView.translatesAutoresizingMaskIntoConstraints = false
        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(balanceAmountLabel)
        balanceStackView.axis = .vertical
        
        
        contentView.addSubview(typeLabel) // importaðnt! Add to contentView
        contentView.addSubview(underlineView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(balanceStackView)
        contentView.addSubview(chevronImageView)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2)
        ])
        
        NSLayoutConstraint.activate([
            underlineView.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1),
            underlineView.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor),
            underlineView.heightAnchor.constraint(equalToConstant: 4),
            underlineView.widthAnchor.constraint(equalTo: typeLabel.widthAnchor, multiplier: 1.1)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.topAnchor, multiplier: 2),
            nameLabel.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImageView.trailingAnchor, multiplier: 1),
            chevronImageView.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 1),
        ])
        
        NSLayoutConstraint.activate([
            trailingAnchor.constraint(equalToSystemSpacingAfter: balanceStackView.trailingAnchor, multiplier: 4),
            balanceStackView.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 0),
        ])
    }
}
