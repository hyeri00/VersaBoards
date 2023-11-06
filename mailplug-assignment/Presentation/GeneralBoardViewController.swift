//
//  GeneralBoardViewController.swift
//  mailplug-assignment
//
//  Created by 혜리 on 2023/11/06.
//

import UIKit

class GeneralBoardViewController: UIViewController {
    
    private let generalBoardView = GeneralBoardView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = generalBoardView
    }
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        let leftImage = IconImage.menuBar.image?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let rightImage = IconImage.searchBar.image?.withTintColor(.black, renderingMode: .alwaysOriginal)
        
        navigationController?.navigationBar.barTintColor = .white
        
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.topItem?.title = "일반 게시판"
            navigationBar.titleTextAttributes = [
                .font: UIFont.systemFont(ofSize: 16),
                .foregroundColor: UIColor.black
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
        // TODO - menuBar 보여주기
    }
    
    @objc
    private func showSearchBar() {
        // TODO - searchBar 보여주기
    }
}
