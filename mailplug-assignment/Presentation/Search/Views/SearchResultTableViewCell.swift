//
//  SearchResultTableViewCell.swift
//  mailplug-assignment
//
//  Created by 혜리 on 2023/11/07.
//

import UIKit
import SnapKit

class SearchResultTableViewCell: UITableViewCell {
    
    // MARK: - UI
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.grey_600
        label.font = Font.Typography.regular14
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
    private func configure() {
        self.backgroundColor = .white
        self.selectionStyle = .none
    }
}
