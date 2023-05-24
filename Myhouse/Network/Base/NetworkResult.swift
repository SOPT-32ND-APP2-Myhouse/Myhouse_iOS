//
//  NetworkResult.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/23.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
