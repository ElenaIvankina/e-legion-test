//
//  SceneDelegate.swift
//  e-legion test
//
//  Created by Елена Иванкина on 08.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = SearchPeopleScreenBuilder.buildModule()
        window?.makeKeyAndVisible()
    }
}
