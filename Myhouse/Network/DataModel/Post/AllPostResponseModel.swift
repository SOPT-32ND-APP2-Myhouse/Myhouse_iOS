//
//  AllPostResponseModel.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/23.
//

import Foundation

struct AllPostResponseModel: Codable {
    let postID: Int
    let imageURL: String
    let title: String

    enum CodingKeys: String, CodingKey {
        case postID = "post_id"
        case imageURL = "image_url"
        case title
    }
}
