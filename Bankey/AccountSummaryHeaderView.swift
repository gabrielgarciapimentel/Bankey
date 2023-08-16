//
//  AccountSummaryHeaderView.swift
//  Bankey
//
//  Created by Gabriel Garcia Pimentel Mendonca on 16/08/23.
//

import UIKit

class AccountSummaryHeaderView: UIView {
    
    let titleLabel = UILabel()
    let greetingsLabel = UILabel()
    let nameLabel = UILabel()
    let dateLabel = UILabel()
    let imageView = UIImageView()
    
    let contentLabelStack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountSummaryHeaderView {
    func style() {
        backgroundColor = .systemCyan
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Bankey"
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1).bold()
        
        greetingsLabel.translatesAutoresizingMaskIntoConstraints = false
        greetingsLabel.text = "Good morning,"
        greetingsLabel.font = UIFont.preferredFont(forTextStyle: .body)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Gabriel"
        nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.text = "Date"
        dateLabel.font = UIFont.preferredFont(forTextStyle: .body)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let imageConfig = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: "sun.max.fill", withConfiguration: imageConfig)
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemYellow
        
        contentLabelStack.translatesAutoresizingMaskIntoConstraints = false
        contentLabelStack.axis = .vertical
        contentLabelStack.spacing = 8
    }
    
    func layout() {
        contentLabelStack.addArrangedSubview(titleLabel)
        contentLabelStack.addArrangedSubview(greetingsLabel)
        contentLabelStack.addArrangedSubview(nameLabel)
        contentLabelStack.addArrangedSubview(dateLabel)
        
        addSubview(contentLabelStack)
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            contentLabelStack.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            contentLabelStack.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: contentLabelStack.bottomAnchor, multiplier: 2)
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentLabelStack.topAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: imageView.trailingAnchor, multiplier: 2),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
