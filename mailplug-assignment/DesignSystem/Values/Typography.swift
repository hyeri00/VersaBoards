//
//  Typography.swift
//  mailplug-assignment
//
//  Created by 혜리 on 2023/11/06.
//

import UIKit

enum Font: String {
    case bold = "SpoqaHanSansNeo-Bold"
    case medium = "SpoqaHanSansNeo-Medium"
    case regular = "SpoqaHanSansNeo-Regular"
    case light = "SpoqaHanSansNeo-Light"
    
    struct Typography {
        static func setFont(font: Font, fontSize: CGFloat) -> UIFont? {
            return UIFont(name: font.rawValue, size: fontSize)
        }
        
        static let medium16 = setFont(font: .medium, fontSize: 16)
        static let medium22 = setFont(font: .medium, fontSize: 22)
        static let regular14 = setFont(font: .regular, fontSize: 14)
        static let regular16 = setFont(font: .regular, fontSize: 16)
        static let light12 = setFont(font: .light, fontSize: 12)
        static let light14 = setFont(font: .light, fontSize: 14)
    }
}

extension UILabel {
    func setLineSpacing(spacing: CGFloat) {
        guard let text = text else { return }

        let attributeString = NSMutableAttributedString(string: text)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = spacing
        attributeString.addAttribute(.paragraphStyle,
                                     value: style,
                                     range: NSRange(location: 0,
                                                    length: attributeString.length))
        attributedText = attributeString
    }
}
