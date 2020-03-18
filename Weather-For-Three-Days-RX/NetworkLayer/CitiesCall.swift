//
//  CitiesCall.swift
//  Weather-For-Three-Days-RX
//
//  Created by user165891 on 3/17/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation
import Endpoints

struct CitiesCall: Call {
    typealias Parser = JSONParser<Cities>

    var ids: String

    var request: URLRequestEncodable {
        return Request(.get, "group", query: ["id": ids,
                                              "units": "metric",
                                              "APPID": "7764fcb1cae95e2051b8d0bba8c7d962"])
    }
}
