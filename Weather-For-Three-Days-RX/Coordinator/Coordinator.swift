//
//  Coordinator.swift
//  Weather-For-Three-Days-RX
//
//  Created by Mena Bebawy on 2/6/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }

    init(navigationController: UINavigationController)
    func start()
}
