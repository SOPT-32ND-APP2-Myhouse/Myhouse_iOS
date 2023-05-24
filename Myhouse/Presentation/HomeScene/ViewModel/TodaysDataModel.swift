//
//  todaysDataModel.swift
//  Myhouse
//
//  Created by Kim Min Joo on 2023/05/16.
//

import UIKit

struct TodaysDataModel {
    let image: UIImage
    let store: String
    let title: String
    let sale: String
    let price: String
    var isScrap: Bool
}

extension TodaysDataModel {
    static func dummy() -> [TodaysDataModel] {
        return [TodaysDataModel(image: ImageLiterals.Card.img_card07,
                                store: "헬로우슬립",
                                title: "[10%쿠폰] 부드러운 카스테라 향균 옥수수솜 여름/간..",
                                sale: "56%",
                                price: "34,900",
                                isScrap: false),
                TodaysDataModel(image: ImageLiterals.Card.img_card07,
                                store: "헬로우슬립", title: "[10%쿠폰] 부드러운 카스테라 향균 옥수수솜 여름/간..",
                                sale: "56%", price: "34,900",
                                isScrap: false),
                TodaysDataModel(image: ImageLiterals.Card.img_card07,
                                store: "헬로우슬립",
                                title: "[10%쿠폰] 부드러운 카스테라 향균 옥수수솜 여름/간..",
                                sale: "56%",
                                price: "34,900",
                                isScrap: false),
                TodaysDataModel(image: ImageLiterals.Card.img_card07,
                                store: "헬로우슬립",
                                title: "[10%쿠폰] 부드러운 카스테라 향균 옥수수솜 여름/간..",
                                sale: "56%",
                                price: "34,900",
                                isScrap: false)
        ]
    }
    static func colorBest() -> [TodaysDataModel] {
        return [TodaysDataModel(image: ImageLiterals.Card.img_card11,
                                store: "헬로우슬립",
                                title: "LED 오로라 블루투스 스피커 무드등 인기상품임...",
                                sale: "56%",
                                price: "34,900",
                                isScrap: false),
                TodaysDataModel(image: ImageLiterals.Card.img_card11,
                                store: "헬로우슬립",
                                title: "LED 오로라 블루투스 스피커 무드등 인기상품임...",
                                sale: "56%",
                                price: "34,900",
                                isScrap: false),
                TodaysDataModel(image: ImageLiterals.Card.img_card11,
                                store: "헬로우슬립",
                                title: "LED 오로라 블루투스 스피커 무드등 인기상품임...",
                                sale: "56%",
                                price: "34,900",
                                isScrap: false),
                TodaysDataModel(image: ImageLiterals.Card.img_card11,
                                store: "헬로우슬립",
                                title: "LED 오로라 블루투스 스피커 무드등 인기상품임...",
                                sale: "56%",
                                price: "34,900",
                                isScrap: false)
        ]
    }
}
