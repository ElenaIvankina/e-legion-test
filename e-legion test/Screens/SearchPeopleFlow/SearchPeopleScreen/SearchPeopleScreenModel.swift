//
//  SearchPeopleScreenModel.swift
//  e-legion test
//
//  Created by Елена Иванкина on 08.03.2023.
//

import Foundation
import CoreLocation

struct SearchPeopleScreenModel {
    let id: UInt
    let imageName: String
    let personName: String
    var coordinate: CLLocationCoordinate2D
    var distance: CLLocationDistance {
        return LocationManager.getDistanceBetweenTwoCoordinates(coordinate1: SelectedUserSingleton.shared.coordinate, coordinate2: coordinate)
    }
}
