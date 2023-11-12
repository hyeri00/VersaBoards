//
//  GeneralBoardViewController.swift
//  mailplug-assignment
//
//  Created by 혜리 on 2023/11/06.
//

import UIKit

class GeneralBoardViewController: UIViewController {
    
    private let generalBoardView = GeneralBoardView()
    
    // MARK: - UI
    
    private let emptyStateView: EmptyBoardView = {
        let view = EmptyBoardView()
        return view
    }()
    
    private let tableView: UITableView = {
        let view = UITableView()
        view.rowHeight = 74
        view.backgroundColor = .white
        view.register(GeneralBoardTableViewCell.self,
                      forCellReuseIdentifier: "GeneralBoardTableViewCell")
        return view
    }()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = generalBoardView
    }
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setNavigationBar()
    }
    
    private func configure() {
        tableView.delegate = self
        tableView.dataSource = self
        
        self.makeConstraints()
    }
    
    private func makeConstraints() {
        self.view.addSubview(self.emptyStateView)
        self.view.addSubview(self.tableView)
        
        self.emptyStateView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        self.tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(15)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setNavigationBar() {
        let leftImage = IconImage.menuBar.image?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let rightImage = IconImage.searchBar.image?.withTintColor(.black, renderingMode: .alwaysOriginal)
        
        navigationController?.navigationBar.barTintColor = .white
        
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.topItem?.title = "일반 게시판"
            navigationBar.titleTextAttributes = [
                .font: Font.Typography.medium16 as Any,
                .foregroundColor: Colors.chocolate_700
            ]
        }
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: leftImage, style: .done,
            target: self, action: #selector(showMenuBar))
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: rightImage, style: .done,
            target: self, action: #selector(showSearchBar))
    }
    
    @objc
    private func showMenuBar() {
        let modalVC = MenuModalViewController()
        modalVC.modalPresentationStyle = .formSheet
        self.present(modalVC, animated: true)
    }
    
    @objc
    private func showSearchBar() {
        let searchVC = SearchViewController()
        searchVC.modalPresentationStyle = .overFullScreen
        self.present(searchVC, animated: true)
    }
}

extension GeneralBoardViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return 1
        }
    
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralBoardTableViewCell",
                                                     for: indexPath) as! GeneralBoardTableViewCell
            
            return cell
        }
}
