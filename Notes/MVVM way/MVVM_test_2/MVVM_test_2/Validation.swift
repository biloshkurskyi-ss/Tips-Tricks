//
//  Validation.swift
//  MVVM_test_2
//
//  Created by Sergey Biloshkurskyi on 7/10/17.
//  Copyright © 2017 Sergey Biloshkurskyi. All rights reserved.
//

import Foundation

enum RegistrationInputValidatorError: Error {
    case emptyUserName
    case emptyPassword
}

class RegistrationInputValidator {
    func validateUserName(_ userName: String?) throws {
        guard let username = userName, !username.isEmpty else { throw RegistrationInputValidatorError.emptyUserName }
    }
    
    func validationPassword(_ password: String?) throws {
        guard let password = password, !password.isEmpty else { throw RegistrationInputValidatorError.emptyPassword }
    }
}
