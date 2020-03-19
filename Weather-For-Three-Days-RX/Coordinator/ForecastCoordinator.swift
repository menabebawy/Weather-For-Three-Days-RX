//
//  ForecastModuleCoordinator.swift
//  Weather-For-Three-Days-RX
//
//  Created by Mena Bebawy on 2/7/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import UIKit

final class CityForecasCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    unowned let navigationController: UINavigationController
    private var city: City!

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    convenience init(navigationController: UINavigationController, city: City) {
        self.init(navigationController: navigationController)
        self.city = city
    }

    func start() {
        let nibName = String(describing: CityForecastViewController.self)
        let forecastViewController = CityForecastViewController(nibName: nibName, bundle: .main)
        forecastViewController.city = city
        navigationController.pushViewController(forecastViewController, animated: true)
    }

}

// MARK: - Forecast module view controller

//extension ForecastModuleCoordinator: ForecastModuleViewControllerDelegate {
//    func forecastModuleViewController(_ controller: ForecastModuleViewController,
//                                      showErrorAlertWithMessage message: String) {
//        navigationController.topViewController?.showErrorAlertController(withMessage: message)
//    }
//
//}
