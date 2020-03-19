//
//  Array+Extension.swift
//  Weather-For-Three-Days-RX
//
//  Created by user165891 on 3/19/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation

extension Array {

    mutating func mutateEach(by transform: (inout Element) throws -> Void) rethrows {
        self = try map { element in
            var element = element
            try transform(&element)
            return element
        }
    }

}
