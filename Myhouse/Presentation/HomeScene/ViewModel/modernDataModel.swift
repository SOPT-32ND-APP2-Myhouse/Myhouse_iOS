//
//  modernDataModel.swift
//  Myhouse
//
//  Created by Kim Min Joo on 2023/05/16.
//

import UIKit

struct modernDataModel {
    let image: UIImage
    let title: String
    let description: String
}

extension modernDataModel {
    static func dummy() -> [modernDataModel] {
        return [modernDataModel(image: ImageLiterals.Card.img_card09, title: "간결해진 삶에 행복을 더하는!",
                              description: "뷰 맛집, 상큼하우스"),
                modernDataModel(image: ImageLiterals.Card.img_card09,  title: "간결해진 삶에 행복을 더하는!",
                              description: "뷰 맛집, 상큼하우스"),
                modernDataModel(image: ImageLiterals.Card.img_card09,  title: "간결해진 삶에 행복을 더하는!",
                              description: "뷰 맛집, 상큼하우스"),
                modernDataModel(image: ImageLiterals.Card.img_card09,  title: "간결해진 삶에 행복을 더하는!",
                              description: "뷰 맛집, 상큼하우스"),
        ]
    }
}
