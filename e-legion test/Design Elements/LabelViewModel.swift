//
//  LabelViewModel.swift
//  e-legion test
//
//  Created by Елена Иванкина on 08.03.2023.
//

import UIKit

protocol LabelViewModelProtocol {
    var text: String? { get }
    var backgroundColor: UIColor? { get }
    var textColor: UIColor? { get }
    var font: UIFont? { get }
    var numberOfLines: Int? { get }
    var textAlignment: NSTextAlignment? { get }
}

struct LabelViewModel: LabelViewModelProtocol {
    let text: String?
    let backgroundColor: UIColor?
    let textColor: UIColor?
    let font: UIFont?
    let textAlignment: NSTextAlignment?
    let numberOfLines: Int?
}

protocol LabelViewProtocol {
    func configure(with: LabelViewModelProtocol)
}

final class LabelView: UILabel, LabelViewProtocol {
    func configure(with model: LabelViewModelProtocol) {
        self.text = model.text
        self.textColor = model.textColor
        self.font = model.font
        if let numberOfLines = model.numberOfLines {
            self.numberOfLines = numberOfLines
        }
        if let backgroundColor = model.backgroundColor {
            self.backgroundColor = backgroundColor
        }
        if let textAlignment = model.textAlignment {
            self.textAlignment = textAlignment
        }
    }
}
