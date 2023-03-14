//
//  SearchPeopleViewController.swift
//  e-legion test
//
//  Created by Елена Иванкина on 08.03.2023.
//

import UIKit

final class SearchPeopleScreenViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var viewModel: SearchPeopleScreenViewModelProtocol
    private var locationManager: LocationManagerProtocol
    private let contentView = SearchPeopleScreenView()
    private let viewManager: SearchPeopleScreenManagerProtocol
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    // MARK: - Initialization
    
    init(viewModel: SearchPeopleScreenViewModelProtocol, locationManager: LocationManagerProtocol, viewManager: SearchPeopleScreenManagerProtocol) {
        self.viewModel = viewModel
        self.locationManager = locationManager
        self.viewManager = viewManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func initialSetup() {
        setTableViewDelegates()
        locationManager.configureLocationManager()
        locationManager.requestLocation()
        viewModel.getSearchPeopleData()
        setBindings()
        viewManager.delegate = self
    }
    
    private func setTableViewDelegates() {
        contentView.setTableViewDataSourceAndDelegate(dataSource: viewManager,
                                                      delegate: viewManager)
    }
    
    private func setBindings () {
        viewModel.observableSelectedUserCellModel.bind { [weak self] data in
            self?.viewManager.selectedUser = data
            self?.contentView.reloadInfo()
        }
        
        viewModel.observableSearchPeopleCellModels.bind { [weak self] data in
            self?.viewManager.cells = data
            self?.contentView.reloadInfo()
        }
    }
}

// MARK: - SearchPeopleScreenManagerDelegate

extension SearchPeopleScreenViewController: SearchPeopleScreenManagerDelegate {
    
    func updateSelectedUserWithMyUserData() {
        SelectedUserSingleton.shared.updateWithMyUserData()
        viewModel.updateSelectedUserData()
    }
    
    func updateSelectedUserWithID(with id: UInt) {
        SelectedUserSingleton.shared.updateWithSearchPeopleScreenModel(with: id)
        viewModel.updateSelectedUserData()
    }
    
    func updateFriendsWithID(appendWith id: UInt) {
        viewModel.updateFriendsWithID(appendWith: id)
    }
    
    func updateFriendsWithID(removeWith id: UInt) {
        viewModel.updateFriendsWithID(removeWith: id)
    }
}
