//
//  UIStackView+.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/14.
//

import UIKit

extension UIStackView {
    
     func addArrangedSubviews(_ views: UIView...) {
         for view in views {
             self.addArrangedSubview(view)
         }
     }
    
}
