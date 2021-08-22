//
//  WeatheryAppTests.swift
//  WeatheryAppTests
//
//  Created by BobbyPhtr on 21/08/21.
//

import UIKit
import XCTest
@testable import WeatheryApp

class WeatheryAppTests: XCTestCase {
    
    func test_appCoordinator_showingLoginOnStart(){
        let sut = MainCoordinator(navigationController: UINavigationController())
        sut.start()
        XCTAssertTrue(sut.navigationController.topViewController is LoginViewController)
        
    }
}
