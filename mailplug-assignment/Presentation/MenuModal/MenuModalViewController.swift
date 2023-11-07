//
//  MenuModalViewController.swift
//  mailplug-assignment
//
//  Created by 혜리 on 2023/11/07.
//

import UIKit
import SnapKit

class MenuModalViewController: UIViewController {
    
    // MARK: - UI
    
    private let closeButton: UIButton = {
        let button = UIButton()
        let image = IconImage.close
        button.setImage(image.image, for: .normal)
        return button
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "게시판"
        label.textColor = Colors.chocolate_700
        label.font = Font.Typography.light14
        return label
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.grey_100
        return view
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 48
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.register(MenuModalTableViewCell.self,
                           forCellReuseIdentifier: "MenuModalTableViewCell")
        return tableView
    }()
}
