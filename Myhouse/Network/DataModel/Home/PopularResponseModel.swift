//
//  PopularResponseModel.swift
//  Myhouse
//
//  Created by Minjoo Kim on 2023/05/25.
//

import Foundation

struct PopularResponseModel: Codable {
    let postID: Int
    let image: String
    let title, subtitle: String
    let rate: Int

    enum CodingKeys: String, CodingKey {
        case postID = "post_id"
        case image, title, subtitle, rate
    }
}
