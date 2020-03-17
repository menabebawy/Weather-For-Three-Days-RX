//
//  WeatherServiceAPI.swift
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
        return Request(.get, "group", query: [ "ids": ids, "api_key": "dc6zaTOxFJmzC" ])
    }
}

struct WeatherServiceAPI: WeatherService {
    let session: Session<AnyClient>

    func getCities<T>(ids: String, completin: @escaping ((T?) -> Void)) where T : Decoder {
    }

    static let baseUrl = "http://api.openweathermap.org/data/2.5/"
    static let appIdKey = "APPID"
    static let idValue = "7764fcb1cae95e2051b8d0bba8c7d962"

    init() {
        let client = AnyClient(baseURL: URL(string: WeatherServiceAPI.baseUrl)!)
        session = Session(with: client)
        session.debug = true
    }

    func request<T: Decodable>(type: T.Type, call: AnyCall<JSONParser<T>>, completin: @escaping ((T?) -> Void)) {
        parameters[WeatherServiceAPI.appIdKey] = WeatherServiceAPI.idValue
        let call = AnyCall<JSONParser<T>>(Request(.get, "group", query: parameters))

        session.start(call: call) { result in
            result.onSuccess { value in
                print(value)
                completin(value)
            }.onError { error in
                print(error)
                completin(error)
            }
        }
    }

}
