//
//  LoginViewModel.swift
//  WeatheryApp
//
//  Created by BobbyPhtr on 21/08/21.
//

import Foundation

protocol LoginFlow {
    func showHome()
    func showRegister()
}

class LoginViewModel {
    
    // Dependency
    private let validator = FormValidator()
    private let authService : AuthService
    private let coordinator : LoginFlow
    
    // Output
    var emailFormError : FormError?
    var passwordFormError : FormError?
    
    init(authService : AuthService, coordinator : LoginFlow) {
        self.authService = authService
        self.coordinator = coordinator
    }

    // If the user pressed login, then validation and login happens.
    func login(email : String, password : String) {
        if validate(email: email, password: password) {
            authService.login(email: email, password: password) { token in
                if token != nil {
                    print("Login Successful")
                    
                } else {
                    print("Login Failed")
                }
            }
        }
    }
    
    func validate(email : String?, password : String?)->Bool{
        validateEmail(email: email)
        validatePassword(password: password)
        
        if let _ = emailFormError, let _ = passwordFormError {
            return false
        }
        return true
    }
    
    private func validateEmail(email : String?) {
        emailFormError = validator.validate(str: email, rules: [.required, .validEmail])
    }
    
    private func validatePassword(password : String?){
        passwordFormError = validator.validate(str: password, rules: [.required])
    }
}

extension MainCoordinator : LoginFlow {
    func showHome() {
        
    }
    
    func showRegister() {
        
    }
}
