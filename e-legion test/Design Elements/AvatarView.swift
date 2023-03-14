//
//  AvatarView.swift
//  e-legion test
//
//  Created by Елена Иванкина on 08.03.2023.
//

import UIKit

final class AvatarView: UIImageView {
    
    // MARK: Constants
    
    private enum Constants {
        static let cornerRadius: CGFloat = 20
        static let borderWidth: CGFloat = 0.5
        static let borderColor: CGColor = Colors.mainBorderColor
        static let backgroundColor: CGColor = Colors.mainBackgroundAvatarView
    }
    
    // MARK: - Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = Constants.cornerRadius
        self.layer.borderWidth = Constants.borderWidth
        self.layer.borderColor = Constants.borderColor
        self.layer.backgroundColor = Constants.backgroundColor
        self.contentMode = .scaleAspectFit
        self.clipsToBounds = true
    }
    
    // MARK: - Public methods
    
    func configure(imageName: String) {
        self.image = UIImage(named: imageName)
    }
}
