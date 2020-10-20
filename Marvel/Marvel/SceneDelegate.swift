//
//  SceneDelegate.swift
//  Marvel
//
//  Created by Pablo Blanco Peris on 16/10/2020.
//  Copyright © 2020 pbp. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let charactersFactoryVC = CharactersFactory().viewController
        let vc = charactersFactoryVC(Empty())

        let navigation = UINavigationController(rootViewController: vc)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}

