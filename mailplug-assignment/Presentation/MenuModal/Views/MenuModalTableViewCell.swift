//
//  MenuModalTableViewCell.swift
//  mailplug-assignment
//
//  Created by 혜리 on 2023/11/07.
//

import UIKit
import SnapKit

class MenuModalTableViewCell: UITableViewCell {
    
    // MARK: - Metric
    
    enum Metric {
        static let leadingMargin: CGFloat = 20
    }
    
    // MARK: - UI
    
    let menuLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.chocolate_700
        label.font = Font.Typography.regular16
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
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        self.addSubview(self.menuLabel)
        
        self.menuLabel.snp.makeConstraints {
            $0.leading.equalTo(Metric.leadingMargin)
            $0.centerY.equalToSuperview()
        }
    }
}
