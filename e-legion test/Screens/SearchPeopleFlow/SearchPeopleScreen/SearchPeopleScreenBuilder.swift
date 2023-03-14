//
//  SearchPeopleScreenBuilder.swift
//  e-legion test
//
//  Created by Елена Иванкина on 08.03.2023.
//

import Foundation

final class SearchPeopleScreenBuilder {
    
    // MARK: - Static method
    
    static func buildModule() -> SearchPeopleScreenViewController {
        let viewModel = SearchPeopleScreenViewModel()
        let locationManager = LocationManager()
        let viewManager = SearchPeopleScreenManager()
        let viewController = SearchPeopleScreenViewController(viewModel: viewModel,
                                                              locationManager: locationManager,
                                                              viewManager: viewManager)
        return viewController
    }
}
