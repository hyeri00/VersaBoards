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
    
    var image: UIImage? {
        switch self {
        case .menuBar:
            return UIImage(named: "hamburger menu")
        case .searchBar:
            return UIImage(named: "MagnifyingGlass")
        }
    }
}
