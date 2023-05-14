//
//  NSObject+.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/14.
//

import Foundation

extension NSObject {

    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
    
}
