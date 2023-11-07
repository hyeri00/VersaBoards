//
//  MenuOptions.swift
//  mailplug-assignment
//
//  Created by 혜리 on 2023/11/07.
//

import Foundation

enum MenuOptions: Int, CaseIterable {
    case general
    case anonymous
    case notice
    case free
    
    var sideMenuLabel: String {
        switch self {
        case .general: return "일반 게시판"
        case .anonymous: return "익명 게시판"
        case .notice: return "공지 게시판"
        case .free: return "자유 게시판"
        }
    }
}
