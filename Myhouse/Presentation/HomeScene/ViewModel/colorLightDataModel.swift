//
//  colorLightDataModel.swift
//  Myhouse
//
//  Created by Minjoo Kim on 2023/05/16.
//

import UIKit

struct colorLightDataModel {
    let image: UIImage
    let user: String
    let rank: Int?
}

extension colorLightDataModel {
    static func dummy() -> [colorLightDataModel] {
        return [colorLightDataModel(image: ImageLiterals.Card.img_card10, user: "songgus", rank: nil),
                colorLightDataModel(image: ImageLiterals.Card.img_card10, user: "songgus", rank: nil),
                colorLightDataModel(image: ImageLiterals.Card.img_card10, user: "songgus", rank: nil),
                colorLightDataModel(image: ImageLiterals.Card.img_card10, user: "songgus", rank: nil),
                colorLightDataModel(image: ImageLiterals.Card.img_card10, user: "songgus", rank: nil),
                colorLightDataModel(image: ImageLiterals.Card.img_card10, user: "songgus", rank: nil)
        ]
    }
    static func top10() -> [colorLightDataModel] {
        return [colorLightDataModel(image: ImageLiterals.Card.img_card02, user: "songgus", rank: 1),
                colorLightDataModel(image: ImageLiterals.Card.img_card02, user: "songgus", rank: 2),
                colorLightDataModel(image: ImageLiterals.Card.img_card02, user: "songgus", rank: 3),
                colorLightDataModel(image: ImageLiterals.Card.img_card02, user: "songgus", rank: 4),
                colorLightDataModel(image: ImageLiterals.Card.img_card02, user: "songgus", rank: 5),
                colorLightDataModel(image: ImageLiterals.Card.img_card02, user: "songgus", rank: 6),
                colorLightDataModel(image: ImageLiterals.Card.img_card02, user: "songgus", rank: 7),
                colorLightDataModel(image: ImageLiterals.Card.img_card02, user: "songgus", rank: 8),
                colorLightDataModel(image: ImageLiterals.Card.img_card02, user: "songgus", rank: 9),
                colorLightDataModel(image: ImageLiterals.Card.img_card02, user: "songgus", rank: 10)
        ]
    }
}
