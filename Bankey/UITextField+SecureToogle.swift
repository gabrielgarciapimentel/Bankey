//
//  UITextField+SecureToogle.swift
//  Bankey
//
//  Created by Gabriel Garcia Pimentel Mendonca on 17/08/23.
//

import Foundation
import UIKit

let passwordToggleButton = UIButton(type: .custom)

extension UITextField {
    func enablePasswordToggle() {
        passwordToggleButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        passwordToggleButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        
        passwordToggleButton.addTarget(self, action: #selector(handleTogglePassword), for: .touchUpInside)
        rightView = passwordToggleButton
        rightViewMode = .always
    }
    
    @objc func handleTogglePassword(){
        isSecureTextEntry.toggle()
        passwordToggleButton.isSelected.toggle()
    }
}
