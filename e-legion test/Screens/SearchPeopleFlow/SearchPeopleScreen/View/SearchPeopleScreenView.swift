//
//  SearchPeopleScreenView.swift
//  e-legion test
//
//  Created by Елена Иванкина on 08.03.2023.
//

import UIKit

final class SearchPeopleScreenView: UIView {
    
    // MARK: Constants
    
    private enum Constants {
        static let cornerRadius: CGFloat = 20
        static let horizontalPadding: CGFloat = 16
        static let verticalPadding: CGFloat = 16
        static let alphaComponent: CGFloat = 0.5
        static let backgroundColor: UIColor = Colors.mainBackgroundCell
        static let backgroundName: String = "backgroundBlueOrange"
    }
    
    // MARK: - Private properties
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.backgroundName)
        return imageView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(AvatarTwoLabelsTableViewCell.self,
                           forCellReuseIdentifier: AvatarTwoLabelsTableViewCell.identifier)
        tableView.register(AvatarLabelHeaderView.self,
                           forHeaderFooterViewReuseIdentifier: AvatarLabelHeaderView.identifier)
        tableView.separatorStyle = .none
        tableView.layer.cornerRadius = Constants.cornerRadius
        tableView.backgroundColor = Constants.backgroundColor.withAlphaComponent(Constants.alphaComponent)
        return tableView
    }()
        
    // MARK: - Initialization
    
    required init() {
        super.init(frame: .zero)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    func setTableViewDataSourceAndDelegate(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }
    
    func reloadInfo() {
        tableView.reloadData()
    }
        
    // MARK: - Private methods
    
    private func initialSetup() {
        configureLayout()
        makeConstraints()
    }
    
    private func configureLayout() {
        addSubview(backgroundImageView)
        addSubview(tableView)
    }
    
    private func makeConstraints() {
        makeConstraintsBackgroundImageView()
        makeConstraintsTableView()
    }
    
    private func makeConstraintsBackgroundImageView() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func makeConstraintsTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: Constants.horizontalPadding),
            tableView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -Constants.horizontalPadding),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
