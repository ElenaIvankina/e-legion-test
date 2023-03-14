//
//  CoordinateChangesProvider.swift
//  e-legion test
//
//  Created by Елена Иванкина on 10.03.2023.
//

import Foundation
import CoreLocation

struct CoordinateChangesProvider {
    
    static let coordinateOffsets: [Double] = [
                                       0.000002,
                                       0.000030,
                                       0.000010,
                                       0.000050,
                                       0.000005,
                                       0.000010,
                                       0.000032,
                                       2.000020,
                                       0.000069,
                                       0.000042,
                                       -0.000009,
                                       -0.000080,
                                       -0.000010,
                                       -0.000090,
                                       -0.000001,
                                       -0.000002,
                                       -0.000091,
                                       -1.000005,
                                       -0.000098,
                                       -0.000054]
    
    static func changeCoordinate(_ coordinate: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
        guard let randomOffsetLatitude = coordinateOffsets.randomElement(),
              let randomOffsetLongitude = coordinateOffsets.randomElement() else {
              return CLLocationCoordinate2D()
        }
        
        let latitudeRange = -90.0...90.0
        let longitudeRange = -180.0...180.0

        var newLatitude = coordinate.latitude
        if latitudeRange.contains(coordinate.latitude + randomOffsetLatitude){
            newLatitude = coordinate.latitude + randomOffsetLatitude
        } else {
            newLatitude = coordinate.latitude - randomOffsetLatitude
        }
        
        var newLongitude = coordinate.longitude
        if longitudeRange.contains(coordinate.longitude + randomOffsetLongitude){
            newLongitude = coordinate.longitude + randomOffsetLongitude
        } else {
            newLongitude = coordinate.longitude - randomOffsetLongitude
        }
        
        return CLLocationCoordinate2D(latitude: newLatitude, longitude: newLongitude)
    }
}
