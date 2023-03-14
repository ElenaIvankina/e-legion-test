//
//  LocationManager.swift
//  e-legion test
//
//  Created by Елена Иванкина on 10.03.2023.
//

protocol LocationManagerProtocol: AnyObject {
    var myCoordinate: CLLocationCoordinate2D { get set }
    func configureLocationManager()
    func requestLocation()
}

import CoreLocation

final class LocationManager: NSObject, LocationManagerProtocol {
    
    var myCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 55.753215,
                                                                      longitude: 37.622503) {
        didSet{
            PeopleDataProvider.myUserData.coordinate = myCoordinate
        }
    }
    var locationManager: CLLocationManager?
    
    func configureLocationManager() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
    }
    
    func requestLocation() {
        locationManager?.requestLocation()
    }
    
    static func getDistanceBetweenTwoCoordinates(coordinate1: CLLocationCoordinate2D, coordinate2: CLLocationCoordinate2D) -> CLLocationDistance {
        return coordinate1.distance(from: coordinate2)
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        myCoordinate = location.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
