//
//  MenuModalViewController.swift
//  mailplug-assignment
//
//  Created by 혜리 on 2023/11/07.
//

import UIKit
import SnapKit

class MenuModalViewController: UIViewController {
    
    // MARK: - Metric
    
    enum Metric {
        static let topMargin: CGFloat = 20
        static let leftRightMargin: CGFloat = 24
        static let buttonSize: CGFloat = 24
        static let titleTopMargin: CGFloat = 25
        static let itemSpacing: CGFloat = 20
        static let separatorThickness: CGFloat = 2
    }
    
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
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        self.view.addSubview(self.closeButton)
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.separatorView)
        self.view.addSubview(self.tableView)
        
        self.closeButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Metric.topMargin)
            $0.leading.equalTo(Metric.leftRightMargin)
            $0.width.height.equalTo(Metric.buttonSize)
        }
        
        self.titleLabel.snp.makeConstraints {
            $0.top.equalTo(closeButton.snp.bottom).offset(Metric.titleTopMargin)
            $0.leading.equalTo(Metric.leftRightMargin)
        }
        
        self.separatorView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(Metric.itemSpacing)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(Metric.separatorThickness)
        }
        
        self.tableView.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).offset(Metric.itemSpacing)
            $0.leading.trailing.bottom.equalToSuperview()
        }
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
