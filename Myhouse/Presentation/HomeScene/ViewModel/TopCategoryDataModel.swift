//
//  TopCategoryDataModel.swift
//  Myhouse
//
//  Created by Kim Min Joo on 2023/05/21.
//

import UIKit

struct TopCategoryDataModel {
    let image: UIImage
    let title: String
}

extension TopCategoryDataModel {
    static func dummy() -> [TopCategoryDataModel] {
        return [TopCategoryDataModel(image: ImageLiterals.Home.img_home05, title: "쇼핑하기"),
                TopCategoryDataModel(image: ImageLiterals.Home.img_home06, title: "오!세일"),
                TopCategoryDataModel(image: ImageLiterals.Home.img_home07, title: "오늘의 딜"),
                TopCategoryDataModel(image: ImageLiterals.Home.img_home08, title: "취향의 발견"),
                TopCategoryDataModel(image: ImageLiterals.Home.img_home09, title: "장보기"),
                TopCategoryDataModel(image: ImageLiterals.Home.img_home10, title: "집들이")
        ]
    }
}
