//
//  ProductResponseModel.swift
//  Myhouse
//
//  Created by Minjoo Kim on 2023/05/25.
//

import Foundation

struct ProductResponseModel: Codable {
    let category: String
    let imageURL: String
    let postTitle: String
    let discount, price, rate, reviewsCount: Int
    let rank: Int

    enum CodingKeys: String, CodingKey {
        case category
        case imageURL = "image_url"
        case postTitle = "post_title"
        case discount, price, rate
        case reviewsCount = "reviews_count"
        case rank
    }
}
