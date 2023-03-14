//
//  SearchPeopleScreenViewModel.swift
//  e-legion test
//
//  Created by Елена Иванкина on 08.03.2023.
//

import Foundation

protocol SearchPeopleScreenViewModelProtocol: AnyObject {
    var observableSelectedUserCellModel: Box<AvatarTwoLabelsCellModel> { get set }
    var observableSearchPeopleCellModels: Box<[AvatarTwoLabelsCellModel]> { get set }
    func updateSelectedUserData()
    func updateFriendsWithID(appendWith id: UInt)
    func updateFriendsWithID(removeWith id: UInt)
    func getSearchPeopleData()
}

final class SearchPeopleScreenViewModel: SearchPeopleScreenViewModelProtocol {
    
    // MARK: - Constants
    
    private enum Constants {
        static let numberOfLines: Int = 1
        static let changingCoordinatesInterval: Double = 3
    }
    
    // MARK: - Public Properties
    
    var observableSelectedUserCellModel: Box<AvatarTwoLabelsCellModel>
    var observableSearchPeopleCellModels: Box<[AvatarTwoLabelsCellModel]> = Box([])
    
    // MARK: - Private Properties
    
    private var selectedUserCellModel: SearchPeopleScreenModel
    private var searchPeopleCellModels: [SearchPeopleScreenModel] = []
    
    // MARK: - Initialization
    
    init() {
        selectedUserCellModel = SelectedUserSingleton.shared.getSearchPeopleScreenModel()
        observableSelectedUserCellModel = Box(SearchPeopleScreenViewModel.getSearchPeopleCellModel(for: selectedUserCellModel))
        changeCoordinatesWithInterval()
    }
    
    // MARK: - Public methods
    
    func getSearchPeopleData() {
        searchPeopleCellModels = PeopleDataProvider.getFriendsData()
        observableSearchPeopleCellModels.value = setSearchPeopleCellModels(searchPeopleCellModels.sorted(by: {$0.distance < $1.distance}))
    }
    
    func updateSelectedUserData() {
        selectedUserCellModel = SelectedUserSingleton.shared.getSearchPeopleScreenModel()
        observableSelectedUserCellModel.value = SearchPeopleScreenViewModel.getSearchPeopleCellModel(for: selectedUserCellModel)
    }

    func updateFriendsWithID(appendWith id: UInt) {
        if let friend = PeopleDataProvider.getFriendWithID(with: id) {
            searchPeopleCellModels.append(friend)
        } else {
            searchPeopleCellModels.append(PeopleDataProvider.getMyUserData())
        }
    }
    
    func updateFriendsWithID(removeWith id: UInt) {
        guard let index = searchPeopleCellModels.firstIndex(where: {$0.id == id}) else {
            return
        }
        searchPeopleCellModels.remove(at: index)
        observableSearchPeopleCellModels.value = setSearchPeopleCellModels(searchPeopleCellModels.sorted(by: {$0.distance < $1.distance}))
    }
}

extension SearchPeopleScreenViewModel {
    
    // MARK: - Static methods
    
    static func getSearchPeopleCellModel (for model: SearchPeopleScreenModel) -> AvatarTwoLabelsCellModel {
        let personNameLabelViewModel = LabelViewModel(text: model.personName,
                                                      backgroundColor: nil,
                                                      textColor: Colors.subFontColor,
                                                      font: Fonts.mainFont,
                                                      textAlignment: .left,
                                                      numberOfLines: Constants.numberOfLines)
        let distanceLabelViewModel = LabelViewModel(text: String(model.distance.describingString()),
                                                    backgroundColor: nil,
                                                    textColor: Colors.mainFontColor,
                                                    font: Fonts.mainBoldFont,
                                                    textAlignment: .right,
                                                    numberOfLines: Constants.numberOfLines)
        return AvatarTwoLabelsCellModel(id: model.id,
                                        imageName: model.imageName,
                                        personNameLabel: personNameLabelViewModel,
                                        distanceLabel: distanceLabelViewModel)
    }
    
    // MARK: - Private methods
    
    private func setSearchPeopleCellModels (_ data: [SearchPeopleScreenModel]) -> [AvatarTwoLabelsCellModel] {
        var cellModels: [AvatarTwoLabelsCellModel] = []
        data.forEach {
            let cellModel = SearchPeopleScreenViewModel.getSearchPeopleCellModel(for: $0)
            cellModels.append(cellModel)
        }
        return cellModels
    }
    
    private func changeCoordinatesWithInterval() {
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.changingCoordinatesInterval) { [weak self] in
            self?.changeCoordinates()
            self?.changeCoordinatesWithInterval()
        }
    }

    private func changeCoordinates() {
        var newModels: [SearchPeopleScreenModel] = []
        searchPeopleCellModels.forEach {
            let id = $0.id
            if id != PeopleDataProvider.getMyUserData().id {
                let newCoordinate = CoordinateChangesProvider.changeCoordinate($0.coordinate)
                let newModel = SearchPeopleScreenModel(id: id,
                                                       imageName: $0.imageName,
                                                       personName: $0.personName,
                                                       coordinate: newCoordinate)
                newModels.append(newModel)
                guard let index = PeopleDataProvider.peopleDataBase.firstIndex(where: {$0.id == id}) else {
                    return
                }
                PeopleDataProvider.peopleDataBase[index].coordinate = newCoordinate
            } else {
                newModels.append($0)
            }
        }
        searchPeopleCellModels = newModels
        observableSearchPeopleCellModels.value = setSearchPeopleCellModels(searchPeopleCellModels.sorted(by: {$0.distance < $1.distance}))
    }
}
