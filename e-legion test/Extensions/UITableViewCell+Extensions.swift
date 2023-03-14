//
//  UITableViewCell+Extensions.swift
//  e-legion test
//
//  Created by Елена Иванкина on 08.03.2023.
//

import UIKit

protocol ReusableViewProtocol: AnyObject {
}

extension ReusableViewProtocol where Self: UIView {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableViewProtocol {
}

extension UITableViewHeaderFooterView: ReusableViewProtocol {
}


