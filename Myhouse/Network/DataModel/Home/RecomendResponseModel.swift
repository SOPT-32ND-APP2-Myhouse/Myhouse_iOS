//
//  ProductResponseModel.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/23.
//

import Foundation

struct RecommendResponseModel: Codable {
    let post: Post
}

// MARK: - Post
struct Post: Codable {
    let tag, userName: String
    let postID: Int
    let imageURL: String
    let title: String

    enum CodingKeys: String, CodingKey {
        case tag
        case userName = "user_name"
        case postID = "post_id"
        case imageURL = "image_url"
        case title
    }
}
