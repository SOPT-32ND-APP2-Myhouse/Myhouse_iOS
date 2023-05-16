//
//  recommendDataModel.swift
//  Myhouse
//
//  Created by Minjoo Kim on 2023/05/15.
//

import UIKit

struct recommendDataModel {
    let image: UIImage
    
    let highlight: String?
    let title: String
}

extension recommendDataModel {
    static func dummy() -> [recommendDataModel] {
        return [recommendDataModel(image: ImageLiterals.Card.img_card08, highlight: nil, title: "깔끔하게 변신한 20살 아파트"),
                recommendDataModel(image: ImageLiterals.Card.img_card08, highlight: nil, title: "소형평수&반려묘를 위한 아이디어! 24평 구축 리모델링"),
                recommendDataModel(image: ImageLiterals.Card.img_card08, highlight: nil, title: "조명 맛집! 자취 4년 차의 서울 신축 6평 원룸"),
                recommendDataModel(image: ImageLiterals.Card.img_card08, highlight: nil, title: "로망집 | 흙을 밟으며 마음껏 뛰노는 마당 있는 집"),
        ]
    }
    static func summer() -> [recommendDataModel] {
        return [recommendDataModel(image: ImageLiterals.Card.img_card16, highlight: "간결해진 삶에 행복을 더하는! ", title: "뷰 맛집, 상큼 하우스"),
                recommendDataModel(image: ImageLiterals.Card.img_card16, highlight: "간결해진 삶에 행복을 더하는! ", title: "뷰 맛집, 상큼 하우스"),
                recommendDataModel(image: ImageLiterals.Card.img_card16, highlight: "간결해진 삶에 행복을 더하는! ", title: "뷰 맛집, 상큼 하우스"),
                recommendDataModel(image: ImageLiterals.Card.img_card16, highlight: "간결해진 삶에 행복을 더하는! ", title: "뷰 맛집, 상큼 하우스"),
        ]
    }
}
