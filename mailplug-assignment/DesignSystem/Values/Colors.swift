//
//  Colors.swift
//  mailplug-assignment
//
//  Created by 혜리 on 2023/11/06.
//

import UIKit

enum Colors {
    static let orange_500 = UIColor(hex: "#FF6412")
    static let grey_100 = UIColor(hex: "#F7F7F7")
    static let grey_400 = UIColor(hex: "#C7C7C7")
    static let grey_500 = UIColor(hex: "#9E9E9E")
    static let grey_600 = UIColor(hex: "#757575")
    static let chocolate_700 = UIColor(hex: "#241E17")
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
