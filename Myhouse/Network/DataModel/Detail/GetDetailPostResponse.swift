//
//  GetDetailPostResponse.swift
//  Myhouse
//
//  Created by 홍준혁 on 2023/05/25.
//

import Foundation

struct GetDetailPostResponse: Codable {
    let post_id: Int
    let user_name, created_date, option_tag: String
    let images: [Image]
    let hast_tag: String
    let like_count, scrap_count, comment_count, view_count: Int
}

struct Image: Codable {
    let image_id: Int
    let image_url: String
    let content: String?
}
