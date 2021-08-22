//
//  LoginTests.swift
//  WeatheryAppTests
//
//  Created by BobbyPhtr on 22/08/21.
//

import XCTest
@testable import WeatheryApp

class LoginTests: XCTestCase {

    var coordinator : MainCoordinator?
    
    override func setUp() {
        super.setUp()
        coordinator = MainCoordinator(navigationController: UINavigationController())
    }
    
    override func tearDown() {
        coordinator = nil
        super.tearDown()
    }
    
    func test_loginViewModel_loginWithInvalidEmail_shouldReturnError(){
        let sut = LoginViewModel(authService: AuthServiceMock(), coordinator: coordinator!)
        
        sut.login(email : "test", password: "12345")
        
        XCTAssertNotNil(sut.emailFormError)
    }

    func test_loginViewModel_loginWithInvalidEmailDomain_shouldReturnError(){
        let sut = LoginViewModel(authService: AuthServiceMock(), coordinator: coordinator!)
        sut.login(email:"test@test", password: "12345")
        
        XCTAssertNotNil(sut.emailFormError)
    }
    
    func test_loginViewModel_loginWithInvalidEmailDomain2_shouldReturnError(){
        let sut = LoginViewModel(authService: AuthServiceMock(), coordinator: coordinator!)
        sut.login(email:"test@test", password: "12345")
        
        XCTAssertNotNil(sut.emailFormError)
    }
    
    func test_loginViewModel_loginWithValidEmailNoPassword_shouldReturnError(){
        
        let sut = LoginViewModel(authService: AuthServiceMock(), coordinator: coordinator!)
        
        sut.login(email:"test@test.com", password: "")
        
        XCTAssertNotNil(sut.passwordFormError)
    }

}

internal final class AuthServiceMock : AuthService {
    func login(email: String, password: String, onCompletion: (String?) -> Void) {
        onCompletion("Login Succeed")
    }
    
    func register(email: String, password: String, onCompletion: (String?) -> Void) {
        onCompletion("Register Succeed")
    }
}
