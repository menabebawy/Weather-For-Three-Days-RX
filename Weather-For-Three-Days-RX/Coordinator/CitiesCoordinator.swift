//
//  CitiesCoordinator.swift
//  Weather-For-Three-Days
//
//  Created by Mena Bebawy on 2/6/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import UIKit
import RxSwift

final class CitiesCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    unowned let navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let nibName = String(describing: CitiesViewController.self)
        let citiesViewController = CitiesViewController(nibName: nibName, bundle: .main)
        citiesViewController.selectedCityObservable
            .subscribe(onNext: { [weak self] city in
                guard let `self` = self else { return }
                CityForecasCoordinator(navigationController: self.navigationController, city: city).start()
            })
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.viewControllers = [citiesViewController]
    }

}

// MARK: - Cities module view controller delegate

//extension CitiesModuleCoordinator: CitiesModuleViewControllerDelegate {
//    func citiesModuleViewController(_ controller: CitiesModuleViewController, didSelectCity city: City) {
//        let forecastModuleCoordinator = ForecastModuleCoordinator(navigationController: navigationController)
//        forecastModuleCoordinator.city = city
//        forecastModuleCoordinator.start()
//    }
//    
//    func citiesModuleViewController(_ controller: CitiesModuleViewController,
//                                    showErrorAlertWithMessage message: String) {
//        navigationController.viewControllers[0].showErrorAlertController(withMessage: message)
//    }
//    
//}
