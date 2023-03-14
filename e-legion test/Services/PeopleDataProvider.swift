//
//  PeopleDataProvider.swift
//  e-legion test
//
//  Created by Елена Иванкина on 08.03.2023.
//

import Foundation
import CoreLocation

struct PeopleDataProvider {
    
    static var myUserData = SearchPeopleScreenModel(id: 55566677,
                                                    imageName: "Avatar 0",
                                                    personName: "Я",
                                                    coordinate: CLLocationCoordinate2D(
                                                        latitude: 55.755786,
                                                        longitude: 37.617633))
    
    static var peopleDataBase = [
        SearchPeopleScreenModel(id: 55566678,
                                imageName: "Avatar 1",
                                personName: "Алина",
                                coordinate: CLLocationCoordinate2D(latitude: 55.755786,
                                                                   longitude: 37.617673)),
        SearchPeopleScreenModel(id: 55566679,
                                imageName: "Avatar 2",
                                personName: "Александр",
                                coordinate: CLLocationCoordinate2D(latitude: 55.755996,
                                                                   longitude: 37.617333)),
        SearchPeopleScreenModel(id: 55566680,
                                imageName: "Avatar 3",
                                personName: "Карина",
                                coordinate: CLLocationCoordinate2D(latitude: 59.938896,
                                                                   longitude: 30.315472)),
        SearchPeopleScreenModel(id: 55566681,
                                imageName: "Avatar 4",
                                personName: "Валерия",
                                coordinate: CLLocationCoordinate2D(latitude: 55.755796,
                                                                   longitude: 37.617933)),
        SearchPeopleScreenModel(id: 55566682,
                                imageName: "Avatar 5",
                                personName: "Виктор",
                                coordinate: CLLocationCoordinate2D(latitude: 59.938916,
                                                                   longitude: 30.315432)),
        SearchPeopleScreenModel(id: 55566683,
                                imageName: "Avatar 6",
                                personName: "Ангелина",
                                coordinate: CLLocationCoordinate2D(latitude: 55.755716,
                                                                   longitude: 37.617693)),
        SearchPeopleScreenModel(id: 55566684,
                                imageName: "Avatar 7",
                                personName: "Марк",
                                coordinate: CLLocationCoordinate2D(latitude: 59.938956,
                                                                   longitude: 30.315472)),
        SearchPeopleScreenModel(id: 55566685,
                                imageName: "Avatar 8",
                                personName: "Елена",
                                coordinate: CLLocationCoordinate2D(latitude: 55.755316,
                                                                   longitude: 37.617293)),
        SearchPeopleScreenModel(id: 55566686,
                                imageName: "Avatar 9",
                                personName: "Валентин",
                                coordinate: CLLocationCoordinate2D(latitude: 55.755496,
                                                                   longitude: 37.617633)),
        SearchPeopleScreenModel(id: 55566687,
                                imageName: "Avatar 10",
                                personName: "Яна",
                                coordinate: CLLocationCoordinate2D(latitude: 55.755686,
                                                                   longitude: 37.618633)),
        SearchPeopleScreenModel(id: 55566688,
                                imageName: "Avatar 11",
                                personName: "Иван",
                                coordinate: CLLocationCoordinate2D(latitude: 55.755726,
                                                                   longitude: 37.617653))
    ]
    
    static func getMyUserData() -> SearchPeopleScreenModel {
        myUserData
    }
    
    static func getFriendsData() -> [SearchPeopleScreenModel] {
        peopleDataBase
    }
    
    static func getFriendWithID(with id: UInt) -> SearchPeopleScreenModel? {
        peopleDataBase.first(where: {$0.id == id})
    }
}
