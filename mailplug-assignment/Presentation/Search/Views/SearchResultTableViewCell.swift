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
}
