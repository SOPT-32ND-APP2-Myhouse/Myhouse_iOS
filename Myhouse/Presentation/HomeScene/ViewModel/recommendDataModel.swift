//
//  recommendDataModel.swift
//  Myhouse
//
//  Created by Minjoo Kim on 2023/05/15.
//

import UIKit

struct recommendDataModel {
    let image: UIImage
    let title: String
}

extension recommendDataModel {
    static func dummy() -> [recommendDataModel] {
        return [recommendDataModel(image: ImageLiterals.Card.img_card08, title: "간결해진 삶에 행복을 더하는!"),
                recommendDataModel(image: ImageLiterals.Card.img_card08, title: "간결해진 삶에 행복을 더하는!"),
                recommendDataModel(image: ImageLiterals.Card.img_card08, title: "간결해진 삶에 행복을 더하는!"),
                recommendDataModel(image: ImageLiterals.Card.img_card08, title: "간결해진 삶에 행복을 더하는!"),
        ]
    }
}
