//
//  categoryDataModel.swift
//  Myhouse
//
//  Created by Kim Min Joo on 2023/05/16.
//

import UIKit

struct categoryDataModel {
    let image: UIImage
    let title: String
}

extension categoryDataModel {
    static func dummy() -> [categoryDataModel] {
        return [categoryDataModel(image: ImageLiterals.Card.img_card07, title: "조명"),
                categoryDataModel(image: ImageLiterals.Card.img_card07, title: "데코 식물"),
                categoryDataModel(image: ImageLiterals.Card.img_card07, title: "가구"),
                categoryDataModel(image: ImageLiterals.Card.img_card07, title: "주방용품"),
                categoryDataModel(image: ImageLiterals.Card.img_card07, title: "조명"),
                categoryDataModel(image: ImageLiterals.Card.img_card07, title: "데코 식물")
        ]
    }
}
