//
//  EmptyView.swift
//  mailplug-assignment
//
//  Created by 혜리 on 11/9/23.
//

import UIKit

class EmptyView: UIView {
    
    // MARK: - Metric
    
    enum Metric {
        static let titleLabelTopMargin: CGFloat = 20
    }
    
    // MARK: - UI
    
    private let titleImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.grey_600
        label.font = Font.Typography.regular14
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
    private func makeConstraints() {
        self.addSubview(self.titleImage)
        self.addSubview(self.titleLabel)
        
        self.titleImage.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        self.titleLabel.snp.makeConstraints {
            $0.top.equalTo(titleImage.snp.bottom).offset(Metric.titleLabelTopMargin)
            $0.centerX.equalTo(titleImage)
        }
    }
}
