//
//  Call+Extension.swift
//  Weather-For-Three-Days-RX
//
//  Created by user165891 on 3/17/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Endpoints

extension Call {

    func start(completion: @escaping (Result<Parser.OutputType>)->()) {
        let client = WeatherClient()
        let session = Session(with: client)

        session.start(call: self, completion: completion)
    }

}
