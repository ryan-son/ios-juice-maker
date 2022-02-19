//
//  JuiceMaker - SceneDelegate.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }

        let window = UIWindow(windowScene: windowScene)
        let juiceOrderViewController = JuiceOrderViewController.instantiate()
        let initialViewController = UINavigationController(rootViewController: juiceOrderViewController)
        window.rootViewController = initialViewController
        window.makeKeyAndVisible()

        self.window = window
    }
}
