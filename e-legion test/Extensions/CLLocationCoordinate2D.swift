//
//  CLLocationCoordinate.swift
//  e-legion test
//
//  Created by Елена Иванкина on 10.03.2023.
//

import CoreLocation

extension CLLocationCoordinate2D {
    func distance(from: CLLocationCoordinate2D) -> CLLocationDistance {
        let destination = CLLocation(latitude: from.latitude,
                                     longitude: from.longitude)
        return CLLocation(latitude: latitude, longitude: longitude).distance(from: destination)
    }
}
