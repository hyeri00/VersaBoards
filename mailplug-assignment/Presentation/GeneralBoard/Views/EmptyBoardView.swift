//
//  EmptyBoardView.swift
//  mailplug-assignment
//
//  Created by 혜리 on 11/10/23.
//

import UIKit

class EmptyBoardView: EmptyView {
    
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
        titleImage.image = UIImage(named: "emptyDataBoard")
        titleLabel.text = "등록된 게시글이 없습니다."
    }
}
