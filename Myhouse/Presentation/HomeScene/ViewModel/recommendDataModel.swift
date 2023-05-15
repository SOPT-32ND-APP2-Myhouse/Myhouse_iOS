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
        return [recommendDataModel(image: ImageLiterals.Card.img_card08, title: "깔끔하게 변신한 20살 아파트"),
                recommendDataModel(image: ImageLiterals.Card.img_card08, title: "소형평수&반려묘를 위한 아이디어! 24평 구축 리모델링"),
                recommendDataModel(image: ImageLiterals.Card.img_card08, title: "조명 맛집! 자취 4년 차의 서울 신축 6평 원룸"),
                recommendDataModel(image: ImageLiterals.Card.img_card08, title: "로망집 | 흙을 밟으며 마음껏 뛰노는 마당 있는 집"),
        ]
    }
}
