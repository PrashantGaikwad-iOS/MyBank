//
//  LoginView.swift
//  MyBank
//
//  Created by Prashant Gaikwad on 25/01/22.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    let stackView = UIStackView()
    let usernameTF = UITextField()
    let passwordTF = UITextField()
    let dividerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("required init not implemented")
    }
    
    //    override var intrinsicContentSize: CGSize {
    //        return CGSize(width: 200, height: 200)
    //    }
}

extension LoginView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        
        usernameTF.translatesAutoresizingMaskIntoConstraints = false
        usernameTF.placeholder = "Username"
        usernameTF.delegate = self
        
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.placeholder = "Password"
        passwordTF.delegate = self
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill
        
        layer.cornerRadius = 5.0
        clipsToBounds = true
    }
    
    func layout() {
        addSubview(stackView)
        stackView.addArrangedSubview(usernameTF)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTF)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}

// MARK: - UITextFieldDelegate
extension LoginView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTF.endEditing(true)
        passwordTF.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
