//
//  FontLiterals.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/14.
//

import UIKit

struct FontName {
    static let NotoBold = "NotoSansKR-Bold"
    static let NotoMedium = "NotoSansKR-Medium"
    static let NotoRegular = "NotoSansKR-Regular"
}

extension UIFont {
    @nonobjc class func NotoBold(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.NotoBold, size: size)!
    }
    
    @nonobjc class func NotoMedium(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.NotoMedium, size: size)!
    }
    
    @nonobjc class func NotoRegular(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.NotoRegular, size: size)!
    }
}
