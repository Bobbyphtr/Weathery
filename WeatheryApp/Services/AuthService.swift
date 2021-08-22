//
//  AuthService.swift
//  WeatheryApp
//
//  Created by BobbyPhtr on 22/08/21.
//

import Foundation

protocol AuthService {
    func login(email : String, password : String, onCompletion : (_ token : String?)->Void)
    func register(email : String, password : String, onCompletion : (_ token : String?)->Void)
}

class AuthServiceImpl : AuthService {
    
    func login(email: String, password: String, onCompletion: (String?) -> Void) {
        // Dummy data
        if email == "admin" && password == "1234" {
            onCompletion("token given for login")
        } else {
            onCompletion(nil)
        }
    }
    
    func register(email: String, password: String, onCompletion: (String?) -> Void) {
        if email.isEmpty || password.isEmpty {
            onCompletion(nil)
        } else {
            onCompletion("token given for autologin")
        }
    }
    
    
    
}
