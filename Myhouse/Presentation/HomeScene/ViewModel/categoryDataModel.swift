//
//  categoryDataModel.swift
//  Myhouse
//
//  Created by Kim Min Joo on 2023/05/16.
//

import UIKit

struct CategoryDataModel {
    let image: UIImage
    let title: String
}

extension CategoryDataModel {
    static func dummy() -> [CategoryDataModel] {
        return [CategoryDataModel(image: ImageLiterals.Home.img_category01, title: "조명"),
                CategoryDataModel(image: ImageLiterals.Home.img_category02, title: "데코 식물"),
                CategoryDataModel(image: ImageLiterals.Home.img_category03, title: "가구"),
                CategoryDataModel(image: ImageLiterals.Home.img_category04, title: "주방용품"),
                CategoryDataModel(image: ImageLiterals.Home.img_category01, title: "조명"),
                CategoryDataModel(image: ImageLiterals.Home.img_category02, title: "데코 식물")
        ]
    }
}
