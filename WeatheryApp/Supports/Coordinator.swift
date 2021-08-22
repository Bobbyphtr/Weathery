//
//  Coordinator.swift
//  WeatheryApp
//
//  Created by BobbyPhtr on 21/08/21.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController : UINavigationController { get }
    
    init(navigationController : UINavigationController)

    func start()
}
