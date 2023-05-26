//
//  AllScrapResponseModel.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/23.
//

import Foundation

struct AllScrapResponseModel: Codable {
    let scrapFolders: [ScrapFolder]

    enum CodingKeys: String, CodingKey {
        case scrapFolders = "scrap_folders"
    }
}

// MARK: - ScrapFolder
struct ScrapFolder: Codable {
    let folderID: Int
    let folderTitle: String
    let scraps: [Scrap]

    enum CodingKeys: String, CodingKey {
        case folderID = "folder_id"
        case folderTitle = "folder_title"
        case scraps
    }
}

// MARK: - Scrap
struct Scrap: Codable {
    let scrapID: Int
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case scrapID = "scrap_id"
        case imageURL = "image_url"
    }
}
