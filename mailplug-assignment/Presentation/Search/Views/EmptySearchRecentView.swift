//
//  EmptySearchRecentView.swift
//  mailplug-assignment
//
//  Created by 혜리 on 11/10/23.
//

import UIKit

class EmptySearchRecentView: EmptyView {
    
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
        titleImage.image = UIImage(named: "emtpySearchRecent")
        titleLabel.text = "게시글의 제목, 내용 또는 작성자에 포함된\n단어 또는 문장을 검색해 주세요."
    }
}
