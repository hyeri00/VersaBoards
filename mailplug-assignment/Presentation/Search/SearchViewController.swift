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
    
    // MARK: - ViewModel
    
    private let viewModel = SearchViewModel()
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // MARK: - Configure
    
    private func configure() {
        view.backgroundColor = .white
        
        searchBar.delegate = self
        resultTableView.delegate = self
        resultTableView.dataSource = self
        
        makeConstraints()
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
    
    private func emptyState() {
        resultTableView.isHidden = true
    }
    
    private func fillState() {
        resultTableView.isHidden = false
    }
}

// MARK: - SearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(
        _ searchBar: UISearchBar,
        textDidChange searchText: String) {
            
            viewModel.performSearch(searchText: searchText)
            resultTableView.reloadData()
            
            if searchText.isEmpty {
                emptyState()
            } else {
                fillState()
            }
        }
    
    func searchBarCancelButtonClicked(
        _ searchBar: UISearchBar) {
            
            self.dismiss(animated: true)
        }
}

// MARK: - TableViewDelegate, TableViewDataSource

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return viewModel.numberOfResults()
        }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultTableViewCell",
                                                     for: indexPath) as! SearchResultTableViewCell
            
            if let result = viewModel.resultAtIndex(indexPath.row) {
                let attributedTitle = NSAttributedString(string: "\(result.title): ")
                let attributedText = NSAttributedString(string: result.keyword,
                                                        attributes: [.font: Font.Typography.regular16 as Any,
                                                                     .foregroundColor: Colors.chocolate_700])
                let attributedString = NSMutableAttributedString()
                attributedString.append(attributedTitle)
                attributedString.append(attributedText)
                
                cell.titleLabel.attributedText = attributedString
            }
            
            cell.accessoryType = .disclosureIndicator
            return cell
        }
}
