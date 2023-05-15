//
//  HomeDataModel.swift
//  Myhouse
//
//  Created by Minjoo Kim on 2023/05/15.
//

import UIKit

struct HomeDataModel {
    let image: UIImage
    let rank: Int
    let title: String
    let description: String
}

extension HomeDataModel {
    static func dummy() -> [HomeDataModel] {
        return [HomeDataModel(image: ImageLiterals.Card.img_card09, rank: 1, title: "간결해진 삶에 행복을 더하는!",
                              description: "뷰 맛집, 상큼하우스"),
                HomeDataModel(image: ImageLiterals.Card.img_card09, rank: 2,  title: "간결해진 삶에 행복을 더하는!",
                              description: "뷰 맛집, 상큼하우스"),
                HomeDataModel(image: ImageLiterals.Card.img_card09, rank: 3,  title: "간결해진 삶에 행복을 더하는!",
                              description: "뷰 맛집, 상큼하우스"),
                HomeDataModel(image: ImageLiterals.Card.img_card09, rank: 4,  title: "간결해진 삶에 행복을 더하는!",
                              description: "뷰 맛집, 상큼하우스"),
        ]
    }
}
