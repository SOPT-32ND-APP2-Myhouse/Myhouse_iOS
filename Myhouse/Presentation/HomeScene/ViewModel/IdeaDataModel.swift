//
//  IdeaDataModel.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/20.
//

import UIKit

struct IdeaDataModel {
    let image: UIImage
    let title: String
    let description: String
    let products: String
}

extension IdeaDataModel {
    static func dummy() -> [IdeaDataModel] {
        return [IdeaDataModel(image: ImageLiterals.Home.img_home01,
                              title: "여름맞이 특가템 총집합",
                              description: "SUMMER 특가 ON ~85%",
                              products: "1089개 상품"),
                IdeaDataModel(image: ImageLiterals.Home.img_home02,
                              title: "5월의 인기 가구 원데이 세일 + 쿠폰혜택",
                              description: "월간 가구 BIG SALE ~89%",
                              products: "2007개 상품"),
                IdeaDataModel(image: ImageLiterals.Home.img_home03,
                              title: "여름시즌특가 + 집꾸미기템 + 숙면꿀템!",
                              description: "[MD추천 패브릭] 데이&나잇 필수템...",
                              products: "580개 상품"),
                IdeaDataModel(image: ImageLiterals.Home.img_home04,
                              title: "유저들의 스타일링과 함께하는!",
                              description: "홈카페 추천템 SALE ~64%",
                              products: "681개 상품")
        ]
    }
}
