//
//  ScrapResonseModel.swift
//  Myhouse
//
//  Created by 최영린 on 2023/06/09.
//

import Foundation

struct ScrapResponseModel: Codable {
    let folderID, scrapID: Int
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case folderID = "folder_id"
        case scrapID = "scrap_id"
        case imageURL = "image_url"
    }
}
