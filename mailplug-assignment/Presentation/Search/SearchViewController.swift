//
//  SearchViewController.swift
//  mailplug-assignment
//
//  Created by 혜리 on 2023/11/07.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    // MARK: - Metric
    
    enum Metric {
        static let topMargin: CGFloat = 10
        static let searchBarLeftRightMargin: CGFloat = 15
    }

    // MARK: - UI
    
    private let searchBar: SearchBar = {
        let searchBar = SearchBar()
        return searchBar
    }()
    
    private let resultTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 56
        tableView.backgroundColor = .white
        tableView.register(SearchResultTableViewCell.self,
                           forCellReuseIdentifier: "SearchResultTableViewCell")
        return tableView
    }()
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // MARK: - Configure
    
    private func configure() {
        view.backgroundColor = Colors.grey_100
    }
    
    private func makeConstraints() {
        self.view.addSubview(self.searchBar)
        self.view.addSubview(self.resultTableView)
        
        self.searchBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Metric.topMargin)
            $0.leading.trailing.equalToSuperview().inset(Metric.searchBarLeftRightMargin)
        }
        
        self.resultTableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(Metric.topMargin)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
