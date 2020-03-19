//
//  RequestCall.swift
//  Weather-For-Three-Days-RX
//
//  Created by user165891 on 3/17/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation
import Endpoints

struct RequestCall<T: Decodable>: Call {
    typealias Parser = JSONParser<T>

    var parameters: [String: String]
    var path: String

    var request: URLRequestEncodable {
        var query = parameters
        query["units"] = "metric"
        query["APPID"] = "7764fcb1cae95e2051b8d0bba8c7d962"
        return Request(.get, path, query: query)
    }

}
