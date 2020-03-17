//
//  CitiesViewModel.swift
//  Weather-For-Three-Days-RX
//
//  Created by user165891 on 3/17/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation

final class CitiesViewModel {

    func requestCities() {
        CitiesCall(ids: Cities.ids()).start { result in
            result.onSuccess { cities in
            }.onError { error in
            }
        }
    }

}
