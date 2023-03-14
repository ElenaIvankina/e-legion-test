//
//  SelectedUserSingleton.swift
//  e-legion test
//
//  Created by Елена Иванкина on 10.03.2023.
//

import Foundation
import CoreLocation

final class SelectedUserSingleton {
    
    static let shared = SelectedUserSingleton(id: PeopleDataProvider.getMyUserData().id,
                                              imageName: PeopleDataProvider.getMyUserData().imageName,
                                              personName: PeopleDataProvider.getMyUserData().personName,
                                              coordinate: PeopleDataProvider.getMyUserData().coordinate)
    
    private var id: UInt
    private var imageName: String
    private var personName: String
    var coordinate: CLLocationCoordinate2D
    
    private init(id: UInt, imageName: String, personName: String, coordinate: CLLocationCoordinate2D) {
        self.id = id
        self.imageName = imageName
        self.personName = personName
        self.coordinate = coordinate
    }
    
    func getSearchPeopleScreenModel() -> SearchPeopleScreenModel {
        SearchPeopleScreenModel(id: SelectedUserSingleton.shared.id,
                                imageName: SelectedUserSingleton.shared.imageName,
                                personName: SelectedUserSingleton.shared.personName,
                                coordinate: SelectedUserSingleton.shared.coordinate)
    }
    
    func updateWithSearchPeopleScreenModel(with id: UInt) {
        var model = PeopleDataProvider.getMyUserData()
        if let modelFriend = PeopleDataProvider.getFriendWithID(with: id) {
            model = modelFriend
        }
        SelectedUserSingleton.shared.id = model.id
        SelectedUserSingleton.shared.imageName = model.imageName
        SelectedUserSingleton.shared.personName = model.personName
        SelectedUserSingleton.shared.coordinate = model.coordinate
    }
    
    func updateWithMyUserData() {
        SelectedUserSingleton.shared.id = PeopleDataProvider.getMyUserData().id
        SelectedUserSingleton.shared.imageName = PeopleDataProvider.getMyUserData().imageName
        SelectedUserSingleton.shared.personName = PeopleDataProvider.getMyUserData().personName
        SelectedUserSingleton.shared.coordinate = PeopleDataProvider.getMyUserData().coordinate
    }
}
