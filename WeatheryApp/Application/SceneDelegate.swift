//
//  SceneDelegate.swift
//  WeatheryApp
//
//  Created by BobbyPhtr on 21/08/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator : MainCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let rootNavCon = UINavigationController()
        appCoordinator = MainCoordinator.init(navigationController: rootNavCon)
        
        window?.rootViewController = rootNavCon
        window?.makeKeyAndVisible()
        
        appCoordinator?.start()
    }

}

