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
}

extension ColorLightDataModel {
    static func dummy() -> [ColorLightDataModel] {
        return [ColorLightDataModel(image: ImageLiterals.Card.img_card10,
                                    user: "songgus",
                                    rank: nil),
                ColorLightDataModel(image: ImageLiterals.Card.img_card10,
                                    user: "songgus",
                                    rank: nil),
                ColorLightDataModel(image: ImageLiterals.Card.img_card10,
                                    user: "songgus",
                                    rank: nil),
                ColorLightDataModel(image: ImageLiterals.Card.img_card10,
                                    user: "songgus",
                                    rank: nil),
                ColorLightDataModel(image: ImageLiterals.Card.img_card10,
                                    user: "songgus",
                                    rank: nil),
                ColorLightDataModel(image: ImageLiterals.Card.img_card10,
                                    user: "songgus",
                                    rank: nil)
        ]
    }
    
    static func top10() -> [ColorLightDataModel] {
        return [ColorLightDataModel(image: ImageLiterals.Card.img_card02,
                                    user: "songgus",
                                    rank: 1),
                ColorLightDataModel(image: ImageLiterals.Card.img_card02,
                                    user: "songgus",
                                    rank: 2),
                ColorLightDataModel(image: ImageLiterals.Card.img_card02,
                                    user: "songgus",
                                    rank: 3),
                ColorLightDataModel(image: ImageLiterals.Card.img_card02,
                                    user: "songgus",
                                    rank: 4),
                ColorLightDataModel(image: ImageLiterals.Card.img_card02,
                                    user: "songgus",
                                    rank: 5),
                ColorLightDataModel(image: ImageLiterals.Card.img_card02,
                                    user: "songgus",
                                    rank: 6),
                ColorLightDataModel(image: ImageLiterals.Card.img_card02,
                                    user: "songgus",
                                    rank: 7),
                ColorLightDataModel(image: ImageLiterals.Card.img_card02,
                                    user: "songgus",
                                    rank: 8),
                ColorLightDataModel(image: ImageLiterals.Card.img_card02,
                                    user: "songgus",
                                    rank: 9),
                ColorLightDataModel(image: ImageLiterals.Card.img_card02,
                                    user: "songgus",
                                    rank: 10)
        ]
    }
}
