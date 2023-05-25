//
//  ColorLightDataModel.swift
//  Myhouse
//
//  Created by Minjoo Kim on 2023/05/16.
//

import UIKit

struct ColorLightDataModel {
    let image: UIImage
    let user: String
    let rank: Int?
    var isScrap: Bool
}

extension ColorLightDataModel {
    static func dummy() -> [ColorLightDataModel] {
        return [ColorLightDataModel(image: ImageLiterals.Card.img_card10,
                                    user: "songgus",
                                    rank: nil,
                                    isScrap: false),
                ColorLightDataModel(image: ImageLiterals.Card.img_card10,
                                    user: "songgus",
                                    rank: nil,
                                    isScrap: false),
                ColorLightDataModel(image: ImageLiterals.Card.img_card10,
                                    user: "songgus",
                                    rank: nil,
                                    isScrap: false),
                ColorLightDataModel(image: ImageLiterals.Card.img_card10,
                                    user: "songgus",
                                    rank: nil,
                                    isScrap: false),
                ColorLightDataModel(image: ImageLiterals.Card.img_card10,
                                    user: "songgus",
                                    rank: nil,
                                    isScrap: false),
                ColorLightDataModel(image: ImageLiterals.Card.img_card10,
                                    user: "songgus",
                                    rank: nil,
                                    isScrap: false)
        ]
    }
    
    static func top10() -> [ColorLightDataModel] {
        return [ColorLightDataModel(image: ImageLiterals.Card.img_card02,
                                    user: "songgus",
                                    rank: 1,
                                    isScrap: false),
                ColorLightDataModel(image: ImageLiterals.Card.img_card02,
                                    user: "songgus",
                                    rank: 2,
                                    isScrap: false),
                ColorLightDataModel(image: ImageLiterals.Card.img_card02,
                                    user: "songgus",
                                    rank: 3,
                                    isScrap: false),
                ColorLightDataModel(image: ImageLiterals.Card.img_card02,
                                    user: "songgus",
                                    rank: 4,
                                    isScrap: false),
                ColorLightDataModel(image: ImageLiterals.Card.img_card02,
                                    user: "songgus",
                                    rank: 5,
                                    isScrap: false),
                ColorLightDataModel(image: ImageLiterals.Card.img_card02,
                                    user: "songgus",
                                    rank: 6,
                                    isScrap: false),
                ColorLightDataModel(image: ImageLiterals.Card.img_card02,
                                    user: "songgus",
                                    rank: 7,
                                    isScrap: false),
                ColorLightDataModel(image: ImageLiterals.Card.img_card02,
                                    user: "songgus",
                                    rank: 8,
                                    isScrap: false),
                ColorLightDataModel(image: ImageLiterals.Card.img_card02,
                                    user: "songgus",
                                    rank: 9,
                                    isScrap: false),
                ColorLightDataModel(image: ImageLiterals.Card.img_card02,
                                    user: "songgus",
                                    rank: 10,
                                    isScrap: false)
        ]
    }
}
