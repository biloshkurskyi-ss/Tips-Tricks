//
//  RegistrationViewControllerViewModel.swift
//  MVVM_test_2
//
//  Created by Sergey Biloshkurskyi on 7/10/17.
//  Copyright © 2017 Sergey Biloshkurskyi. All rights reserved.
//

import Foundation
import UIKit

protocol RegistrationViewControllerViewModel {
    
    weak var delegate: RegistrationViewControllerViewModelDelegate? { get set }
    
    var userNamePlaceholderText: String? { get }
    var userNameBorderColor: UIColor? { get }
    var userNameBorderWidth: CGFloat { get }
    var passwordPlaceholderText: String? { get }
    var passwordBorderColor: UIColor? { get }
    var passwordBorderWidth: CGFloat { get }
    var submitTextColor: UIColor? { get }
    var submitEnabled: Bool { get }
    
    func submitButtonPressed()
    func userNameTextDidChangedToText(_ text: String?)
    func passwordTextDidChangedToText(_ text: String?)
}

protocol RegistrationViewControllerViewModelDelegate: class {
    func reloadViews()
    func moveToHomeScreen()
}
