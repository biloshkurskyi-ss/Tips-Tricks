//
//  RegistrationViewControllerDefaultViewModel.swift
//  MVVM_test_2
//
//  Created by Sergey Biloshkurskyi on 7/10/17.
//  Copyright © 2017 Sergey Biloshkurskyi. All rights reserved.
//

import UIKit

class RegistrationViewControllerDefaultViewModel: RegistrationViewControllerViewModel {

    private let registrationInputValidator = RegistrationInputValidator()
    private var userNameText = ""
    private var passwordText = ""
    private var usernameValid = false
    private var passwordValid = false
    
    // MARK: - Properties
    // MARK: -- Internal
    
    weak var delegate: RegistrationViewControllerViewModelDelegate?
    
    let userNamePlaceholderText: String? = "Username"
    var userNameBorderColor: UIColor? {
        return usernameValid ? .black : .red
    }
    let userNameBorderWidth: CGFloat = 2.0
    
    let passwordPlaceholderText: String? = "Password"
    var passwordBorderColor: UIColor? {
        return passwordValid ? .black : .red
    }
    let passwordBorderWidth: CGFloat = 2.0
    
    var submitTextColor: UIColor? {
        return submitEnabled ? .black : .red
    }
    
    var submitEnabled: Bool {
        return usernameValid && passwordValid
    }

    // MARK: - Actions
    func submitButtonPressed() {
        do {
            try registrationInputValidator.validateUserName(userNameText)
            try registrationInputValidator.validationPassword(passwordText)
            
            tellDelegateToMoveToHomeScreen()
        } catch {
            print("Danger! Will be danger")
        }
    }
    
    func userNameTextDidChangedToText(_ text: String?) {
        userNameText = text ?? ""
        
        do {
            try registrationInputValidator.validateUserName(userNameText)
            usernameValid = true
        } catch {
            usernameValid = false
        }
        
        tellDelegateToReloadViews()
    }
    
    func passwordTextDidChangedToText(_ text: String?) {
        passwordText = text ?? ""
        
        do {
            try registrationInputValidator.validationPassword(passwordText)
            passwordValid = true
        } catch {
            passwordValid = false
        }
        
        tellDelegateToReloadViews()
    }
    
    //MARK: - Delegate Response
    private func tellDelegateToMoveToHomeScreen() {
        delegate?.moveToHomeScreen()
    }
    
    private func tellDelegateToReloadViews() {
        delegate?.reloadViews()
    }
    
}
