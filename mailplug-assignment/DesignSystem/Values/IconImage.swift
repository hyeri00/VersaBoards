//
//  IconImage.swift
//  mailplug-assignment
//
//  Created by 혜리 on 2023/11/06.
//

import UIKit

enum IconImage {
    case menuBar
    case searchBar
    
    case attachment
    case badge_new
    case badge_notice
    case badge_re
    case eye
    
    case close
    
    var image: UIImage? {
        switch self {
        case .menuBar:
            return UIImage(named: "hamburgerMenu")
        case .searchBar:
            return UIImage(named: "magnifyingGlass")
            
        case .attachment:
            return UIImage(named: "attachment")
        case .badge_new:
            return UIImage(named: "badge_new")
        case .badge_notice:
            return UIImage(named: "badge_notice")
        case .badge_re:
            return UIImage(named: "badge_re")
        case .eye:
            return UIImage(named: "eye")
            
        case .close:
            return UIImage(named: "close")
        }
    }
}
