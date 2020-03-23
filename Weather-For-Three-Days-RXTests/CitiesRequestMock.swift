//
//  CitiesRequestMock.swift
//  Weather-For-Three-Days-RXTests
//
//  Created by Mena Bebawy on 3/22/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation
import Endpoints

struct CitiesRequestMock<T: Decodable>: Call {
    typealias Parser = JSONParser<T>

    var request: URLRequestEncodable {
        return Request(.get, "", query: [:])
    }

}

extension Call {
    
}
