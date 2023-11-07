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
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // MARK: - Configure
    
    private func configure() {
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - TableViewDelegate, TableViewDataSource

extension MenuModalViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return MenuOptions.allCases.count
        }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuModalTableViewCell",
                                                     for: indexPath) as! MenuModalTableViewCell
            let menuOption = MenuOptions(rawValue: indexPath.row)
            cell.menuLabel.text = menuOption?.sideMenuLabel
            
            return cell
        }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath) {
            
            switch indexPath.row {
            case 0:
                dismiss(animated: true)
            case 1:
                // TODO: - 익명 게시판
                break
            case 2:
                // TODO: - 공지 게시판
                break
            case 3:
                // TODO: - 자유 게시판
                break
            default:
                break
            }
        }
}
