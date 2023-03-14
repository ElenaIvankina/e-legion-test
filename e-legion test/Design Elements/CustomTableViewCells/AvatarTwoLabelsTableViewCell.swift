//
//  AvatarTwoLabelsTableViewCell.swift
//  e-legion test
//
//  Created by Елена Иванкина on 08.03.2023.
//

import UIKit

struct AvatarTwoLabelsCellModel {
    let id: UInt
    let imageName: String
    let personNameLabel: LabelViewModel
    let distanceLabel: LabelViewModel
}

final class AvatarTwoLabelsTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
        static let commonInset: CGFloat = 4
        static let horizontalPadding: CGFloat = 16
        static let avatarWidthAndHeight: CGFloat = 40
        static let cornerRadius: CGFloat = 20
        static let borderWidth: CGFloat = 0.5
        static let alphaForCell: CGFloat = 0
        static let alphaForContainerView: CGFloat = 0.7
        static let borderColor: CGColor = Colors.mainBorderColor
        static let backgroundColor: UIColor = Colors.mainBackgroundCell
    }
    
    // MARK: - Private properties
    
    private let containerView: UIView = {
        let view = UIView()
        view.layer.borderColor = Constants.borderColor
        view.layer.borderWidth = Constants.borderWidth
        view.layer.cornerRadius = Constants.cornerRadius
        view.backgroundColor =  Constants.backgroundColor.withAlphaComponent(Constants.alphaForContainerView)
        return view
    }()
    
    private let blankCellModel: AvatarTwoLabelsCellModel = {
        let blankLabelViewModel = LabelViewModel(text: "",
                                                 backgroundColor: nil,
                                                 textColor: nil,
                                                 font: nil,
                                                 textAlignment: nil,
                                                 numberOfLines: nil)
        return AvatarTwoLabelsCellModel(id: 0,
                                        imageName: "NoAvatar",
                                        personNameLabel: blankLabelViewModel,
                                        distanceLabel: blankLabelViewModel)
    }()

    private let avatarImageView = AvatarView()
    private let personNameLabel = LabelView()
    private let distanceLabel = LabelView()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        configure(model: blankCellModel)
    }
    
    // MARK: - Public methods
    
    func configure(model: AvatarTwoLabelsCellModel) {
        avatarImageView.configure(imageName: model.imageName)
        personNameLabel.configure(with: model.personNameLabel)
        distanceLabel.configure(with: model.distanceLabel)
    }
    
    // MARK: - Private methods
    
    private func initialSetup() {
        backgroundColor =  Constants.backgroundColor.withAlphaComponent(Constants.alphaForCell)
        configureLayout()
        makeConstraints()
    }
    
    private func configureLayout() {
        contentView.addSubview(containerView)
        containerView.addSubview(avatarImageView)
        containerView.addSubview(personNameLabel)
        containerView.addSubview(distanceLabel)
    }
    
    private func makeConstraints() {
        makeConstraintsContainerView()
        makeConstraintsAvatarImageView()
        makeConstraintsPersonNameLabel()
        makeConstraintsDistanceLabel()
    }
    
    private func makeConstraintsContainerView() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.commonInset),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.commonInset),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.commonInset),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.commonInset)
        ])
    }
    
    private func makeConstraintsAvatarImageView() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                                     constant: Constants.horizontalPadding),
            avatarImageView.heightAnchor.constraint(equalToConstant: Constants.avatarWidthAndHeight),
            avatarImageView.widthAnchor.constraint(equalToConstant: Constants.avatarWidthAndHeight)
        ])
    }
    
    private func makeConstraintsPersonNameLabel() {
        personNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            personNameLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            personNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor,
                                                     constant: Constants.horizontalPadding)
        ])
    }
    
    private func makeConstraintsDistanceLabel() {
        distanceLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            distanceLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            distanceLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,
                                                     constant: -Constants.horizontalPadding)
        ])
    }
}

