//
//  SceneDelegate.swift
//  Weather-For-Three-Days-RX
//
//  Created by user165891 on 3/17/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var citiesCoordinator: CitiesCoordinator!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = UINavigationController()

        citiesCoordinator = CitiesCoordinator(navigationController: window?.rootViewController as! UINavigationController)
        citiesCoordinator.start()

        window?.makeKeyAndVisible()
    }

}
