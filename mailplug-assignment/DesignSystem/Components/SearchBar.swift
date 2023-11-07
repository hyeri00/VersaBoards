//
//  SearchBar.swift
//  mailplug-assignment
//
//  Created by 혜리 on 2023/11/07.
//

import UIKit

class SearchBar: UISearchBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureDefault()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func configureDefault() {
        self.layer.cornerRadius = 4
        self.searchBarStyle = .minimal
        
        setColors()
    }
    
    private func setColors() {
         self.tintColor = Colors.chocolate_700
         self.backgroundColor = .white
     }
}
