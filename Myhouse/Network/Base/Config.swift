//
//  Config.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/23.
//

import Foundation

enum Config {
    
    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist cannot found.")
        }
        return dict
    }()
}

extension Config {
    
    // MARK: Base URL
    
    static let baseURL: String = {
        guard let url = Config.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("Base URL is not set in plist for this configuration.")
        }
        return url
    }()
    
    // MARK: Home URL
    
    // MARK: Post URL
    
    static let getAllPostURL = baseURL + "/posts"
    
    static func postDetailURL(post_id: Int) -> String {
        return baseURL + "/posts/\(post_id)/water"
    }
    
    // MARK: Scrap URL
    
    static let getAllScrapURL = baseURL + "/scrap/all"
    
}
