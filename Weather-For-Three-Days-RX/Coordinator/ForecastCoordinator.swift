//
//  ForecastModuleCoordinator.swift
//  Weather-For-Three-Days
//
//  Created by Mena Bebawy on 2/7/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import UIKit
import ForecastModule
import Entities

final class ForecastModuleCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var city: City!
    unowned let navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let nibName = String(describing: ForecastModuleViewController.self)
        let forecastViewController = ForecastModuleViewController(nibName: nibName, bundle: .main)
        forecastViewController.city = city
        forecastViewController.delegate = self
        navigationController.pushViewController(forecastViewController, animated: true)
    }
    
}

// MARK: - Forecast module view controller

extension ForecastModuleCoordinator: ForecastModuleViewControllerDelegate {
    func forecastModuleViewController(_ controller: ForecastModuleViewController,
                                      showErrorAlertWithMessage message: String) {
        navigationController.topViewController?.showErrorAlertController(withMessage: message)
    }

}
