//
//  recommendDataModel.swift
//  Myhouse
//
//  Created by Minjoo Kim on 2023/05/15.
//

import UIKit

struct RecommendDataModel {
    let image: UIImage
    let highlight: String?
    let title: String
    var isScrap: Bool
}

extension RecommendDataModel {
    static func dummy() -> [RecommendDataModel] {
        return [RecommendDataModel(image: ImageLiterals.Card.img_card08,
                                   highlight: nil,
                                   title: "깔끔하게 변신한 20살 아파트",
                                   isScrap: false),
                RecommendDataModel(image: ImageLiterals.Card.img_card08,
                                   highlight: nil,
                                   title: "소형평수&반려묘를 위한 아이디어! 24평 구축 리모델링",
                                   isScrap: false),
                RecommendDataModel(image: ImageLiterals.Card.img_card08,
                                   highlight: nil,
                                   title: "조명 맛집! 자취 4년 차의 서울 신축 6평 원룸",
                                   isScrap: false),
                RecommendDataModel(image: ImageLiterals.Card.img_card08,
                                   highlight: nil,
                                   title: "로망집 | 흙을 밟으며 마음껏 뛰노는 마당 있는 집",
                                   isScrap: false)
        ]
    }
    
    static func summer() -> [RecommendDataModel] {
        return [RecommendDataModel(image: ImageLiterals.Card.img_card16,
                                   highlight: "간결해진 삶에 행복을 더하는! ",
                                   title: "뷰 맛집, 상큼 하우스",
                                   isScrap: false),
                RecommendDataModel(image: ImageLiterals.Card.img_card16,
                                   highlight: "간결해진 삶에 행복을 더하는! ",
                                   title: "뷰 맛집, 상큼 하우스",
                                   isScrap: false),
                RecommendDataModel(image: ImageLiterals.Card.img_card16,
                                   highlight: "간결해진 삶에 행복을 더하는! ",
                                   title: "뷰 맛집, 상큼 하우스",
                                   isScrap: false),
                RecommendDataModel(image: ImageLiterals.Card.img_card16,
                                   highlight: "간결해진 삶에 행복을 더하는! ",
                                   title: "뷰 맛집, 상큼 하우스",
                                   isScrap: false)
        ]
    }
    
    static func review() -> [RecommendDataModel] {
        return [RecommendDataModel(image: ImageLiterals.Card.img_card14,
                                   highlight: "#하대원동 아튼빌 #30평대",
                                   title: "전체 인테리어를 해야겠다 생각해서 5군데 견적을 비교했습니다. 일정이 촉박하...",
                                   isScrap: false),
                RecommendDataModel(image: ImageLiterals.Card.img_card14,
                                   highlight: "#하대원동 아튼빌 #30평대",
                                   title: "전체 인테리어를 해야겠다 생각해서 5군데 견적을 비교했습니다. 일정이 촉박하...",
                                   isScrap: false),
                RecommendDataModel(image: ImageLiterals.Card.img_card14,
                                   highlight: "#하대원동 아튼빌 #30평대",
                                   title: "전체 인테리어를 해야겠다 생각해서 5군데 견적을 비교했습니다. 일정이 촉박하...",
                                   isScrap: false),
                RecommendDataModel(image: ImageLiterals.Card.img_card14,
                                   highlight: "#하대원동 아튼빌 #30평대",
                                   title: "전체 인테리어를 해야겠다 생각해서 5군데 견적을 비교했습니다. 일정이 촉박하...",
                                   isScrap: false)
        ]
    }
}
