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
        
        setCancelButton()
        setColors()
    }
    
    private func setCancelButton() {
        setShowsCancelButton(true, animated: false)
        
        if let cancelButton = self.value(forKey: "cancelButton") as? UIButton {
            cancelButton.setTitle("취소", for: .normal)
            cancelButton.setTitleColor(Colors.grey_600, for: .normal)
            cancelButton.titleLabel?.font = Font.Typography.regular16
        }
    }
    
    private func setColors() {
         self.tintColor = Colors.chocolate_700
         self.backgroundColor = .white
     }
}
