//
//  Main.swift
//  Entities
//
//  Created by Mena Bebawy on 2/6/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation

public struct Main: Decodable {
    public let temperature: Float
    public var min: Float!
    public var max: Float!
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
    }
    
}
