//
//  ViewController.swift
//  MVVM_test_2
//
//  Created by Sergey Biloshkurskyi on 7/10/17.
//  Copyright © 2017 Sergey Biloshkurskyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, RegistrationViewControllerViewModelDelegate {

    // MARK: - Properties
    // MARK: -- Internal
    
    var viewModel: RegistrationViewControllerViewModel? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    // MARK: -- Outlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = RegistrationViewControllerDefaultViewModel()
        
        configureAllViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Configuration Methods
    
    private func configureAllViews() {
        configureUserNameTextField()
        configurePasswordTextField()
        configureSubmitButton()
    }
    
    private func configureUserNameTextField() {
        guard let viewModel = viewModel else { return }

        usernameTextField.placeholder = viewModel.userNamePlaceholderText
        usernameTextField.layer.borderColor = viewModel.userNameBorderColor?.cgColor
        usernameTextField.layer.borderWidth = viewModel.userNameBorderWidth
    }
    
    private func configurePasswordTextField() {
        guard let viewModel = viewModel else { return }

        passwordTextField.placeholder = viewModel.passwordPlaceholderText
        passwordTextField.layer.borderColor = viewModel.passwordBorderColor?.cgColor
        passwordTextField.layer.borderWidth = viewModel.passwordBorderWidth
    }
    
    private func configureSubmitButton() {
        guard let viewModel = viewModel else { return }
        
        submitButton.setTitleColor(viewModel.submitTextColor, for: .normal)
        submitButton.isEnabled = viewModel.submitEnabled
    }
    
    // MARK - Actions
    
    @IBAction private func submitButtonPressed(_ sender: UIButton) {
        viewModel?.submitButtonPressed()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
        
        if textField == usernameTextField {
            viewModel?.userNameTextDidChangedToText(text)
        } else if textField == passwordTextField {
            viewModel?.passwordTextDidChangedToText(text)
        }
        
        return true
    }
    
    // MARK: - RegistrationViewControllerViewModelelegate Methods
    
    func reloadViews() {
        configureAllViews()
    }
    
    func moveToHomeScreen() {
        let alertController = UIAlertController(title: "Success!",
                                                message: "Successful Registration!",
                                                preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

