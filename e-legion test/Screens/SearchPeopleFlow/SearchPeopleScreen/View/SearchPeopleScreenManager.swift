//
//  SearchPeopleScreenManager.swift
//  e-legion test
//
//  Created by Елена Иванкина on 08.03.2023.
//

import UIKit

protocol SearchPeopleScreenManagerProtocol: UITableViewDataSource, UITableViewDelegate {
    var selectedUser: AvatarTwoLabelsCellModel? { get set }
    var cells: [AvatarTwoLabelsCellModel] { get set }
    var delegate: SearchPeopleScreenManagerDelegate? { get set }
}

protocol SearchPeopleScreenManagerDelegate: AnyObject {
    func updateSelectedUserWithMyUserData()
    func updateSelectedUserWithID(with id: UInt)
    func updateFriendsWithID(appendWith id: UInt)
    func updateFriendsWithID(removeWith id: UInt)
}

final class SearchPeopleScreenManager: NSObject, SearchPeopleScreenManagerProtocol {
    
    // MARK: - Constants
    
    private enum Constants {
        static let rowHeight: CGFloat = 64
        static let headerHeight: CGFloat = 64
    }
    
    var selectedUser: AvatarTwoLabelsCellModel?
    var cells: [AvatarTwoLabelsCellModel] = []
    weak var delegate: SearchPeopleScreenManagerDelegate?

    // MARK: - Actions

    @objc func handleTapOnSelectedUser(_ sender: UITapGestureRecognizer? = nil) {
        guard let selectedUser = selectedUser else {
            return
        }
        if selectedUser.id != PeopleDataProvider.getMyUserData().id {
            delegate?.updateFriendsWithID(appendWith: selectedUser.id)
            delegate?.updateSelectedUserWithMyUserData()
            delegate?.updateFriendsWithID(removeWith: PeopleDataProvider.getMyUserData().id)
        }
    }
}

extension SearchPeopleScreenManager {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.rowHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let selectedUser = selectedUser,
              let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: AvatarLabelHeaderView.identifier) as? AvatarLabelHeaderView else {
            return UIView()
        }
        view.configure(model: selectedUser)
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapOnSelectedUser(_:)))
        view.addGestureRecognizer(tap)
        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        Constants.headerHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AvatarTwoLabelsTableViewCell.identifier) as? AvatarTwoLabelsTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(model: cells[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let idToSelect = cells[indexPath.row].id
        let idToDeselect = selectedUser!.id
        delegate?.updateFriendsWithID(appendWith: idToDeselect)
        delegate?.updateSelectedUserWithID(with: idToSelect)
        delegate?.updateFriendsWithID(removeWith: idToSelect)
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }
}

