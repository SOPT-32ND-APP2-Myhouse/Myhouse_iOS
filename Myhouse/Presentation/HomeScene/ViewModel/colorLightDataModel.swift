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
}

extension colorLightDataModel {
    static func dummy() -> [colorLightDataModel] {
        return [colorLightDataModel(image: ImageLiterals.Card.img_card10, user: "songgus"),
                colorLightDataModel(image: ImageLiterals.Card.img_card10, user: "songgus"),
                colorLightDataModel(image: ImageLiterals.Card.img_card10, user: "songgus"),
                colorLightDataModel(image: ImageLiterals.Card.img_card10, user: "songgus"),
                colorLightDataModel(image: ImageLiterals.Card.img_card10, user: "songgus"),
                colorLightDataModel(image: ImageLiterals.Card.img_card10, user: "songgus")
        ]
    }
}
