//
//  EmptySearchResultView.swift
//  mailplug-assignment
//
//  Created by 혜리 on 11/10/23.
//

import UIKit

class EmptySearchResultView: EmptyView {
    
    // MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
    private func configure() {
        titleImage.image = UIImage(named: "emptySearchResult")
        titleLabel.text = "검색 결과가 없습니다.\n다른 검색어를 입력해 보세요."
    }
}
