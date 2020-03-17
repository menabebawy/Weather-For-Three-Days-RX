//
//  WeatherServiceAPI.swift
//  Weather-For-Three-Days-RX
//
//  Created by user165891 on 3/17/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation
import Endpoints

struct WeatherClient: Client {
    private let anyClient = AnyClient(baseURL: URL(string: "http://api.openweathermap.org/data/2.5/")!)

    func encode<C: Call>(call: C) -> URLRequest {
        return anyClient.encode(call: call)
    }

    func parse<C : Call>(sessionTaskResult result: URLSessionTaskResult, for call: C) throws -> C.Parser.OutputType {
        do {
            return try anyClient.parse(sessionTaskResult: result, for: call)
        } catch {
            guard
                let response = result.httpResponse,
                let data = result.data,
                let errorDict = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any],
                let meta = errorDict["meta"] as? [String: Any],
                let errorCode = meta["error_code"] as? String else {
                throw error
            }

            throw StatusCodeError.unacceptable(code: response.statusCode, reason: errorCode)
        }
    }

}
