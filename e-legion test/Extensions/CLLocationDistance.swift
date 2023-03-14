//
//  CLLocationDistance.swift
//  e-legion test
//
//  Created by Елена Иванкина on 10.03.2023.
//

import CoreLocation

extension CLLocationDistance {
    func describingString() -> String {
        switch self {
        case 0...1999 : return "\(Int(self))м"
        case 2000...30000 : return "\(Int(self/1000))km"
        case 30001... : return "more than 30km"
        default : return "unknown"
        }
    }
}
