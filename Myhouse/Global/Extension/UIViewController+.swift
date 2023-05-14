//
//  UIViewController+.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/14.
//

import UIKit

extension UIViewController {
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
