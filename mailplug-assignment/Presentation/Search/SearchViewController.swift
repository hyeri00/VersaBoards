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
    
    // MARK: - Search Results
    
    var searchResults: [(String, String)] = []
    
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
    
    private func showSearchResult(searchText: String) -> [(String, String)] {
        var results: [(String, String)] = []
        
        let titleFields = ["전체", "제목", "내용", "작성자"]
        
        for field in titleFields {
            results.append((field, searchText))
        }
        return results
    }
}

// MARK: - SearchBarDelegate, TableViewDataSource, TableViewDelegate

extension SearchViewController: UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    func searchBar(
        _ searchBar: UISearchBar,
        textDidChange searchText: String) {
            
            searchResults = showSearchResult(searchText: searchText)
            resultTableView.reloadData()
        }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return searchResults.count
        }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultTableViewCell",
                                                     for: indexPath) as! SearchResultTableViewCell
            
            let (key, value) = searchResults[indexPath.row]
            cell.titleLabel.text = "\(key): \(value)"
            cell.accessoryType = .disclosureIndicator
            return cell
        }
}
