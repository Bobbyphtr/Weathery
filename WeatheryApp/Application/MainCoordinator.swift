//
//  MainCoordinator.swift
//  WeatheryApp
//
//  Created by BobbyPhtr on 21/08/21.
//

import Foundation
import UIKit

class MainCoordinator : Coordinator {
    
    var navigationController: UINavigationController
    
    private let authService : AuthService = AuthServiceImpl()
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginVc = LoginViewController()
        loginVc.viewModel = LoginViewModel(authService: authService, coordinator: self)
        navigationController.pushViewController(loginVc, animated: false)
    }
    
}
