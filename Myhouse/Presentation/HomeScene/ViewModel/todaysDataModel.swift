//
//  todaysDataModel.swift
//  Myhouse
//
//  Created by Kim Min Joo on 2023/05/16.
//

import UIKit

struct todaysDataModel {
    let image: UIImage
    let store: String
    let title: String
    let sale: String
    let price: String
}

extension todaysDataModel {
    static func dummy() -> [todaysDataModel] {
        return [todaysDataModel(image: ImageLiterals.Card.img_card07, store: "헬로우슬립", title: "[10%쿠폰] 부드러운 카스테라 향균 옥수수솜 여름/간..", sale: "56%", price: "34,900"),
                todaysDataModel(image: ImageLiterals.Card.img_card07, store: "헬로우슬립", title: "[10%쿠폰] 부드러운 카스테라 향균 옥수수솜 여름/간..", sale: "56%", price: "34,900"),
                todaysDataModel(image: ImageLiterals.Card.img_card07, store: "헬로우슬립", title: "[10%쿠폰] 부드러운 카스테라 향균 옥수수솜 여름/간..", sale: "56%", price: "34,900"),
                todaysDataModel(image: ImageLiterals.Card.img_card07, store: "헬로우슬립", title: "[10%쿠폰] 부드러운 카스테라 향균 옥수수솜 여름/간..", sale: "56%", price: "34,900"),
        ]
    }
    static func colorBest() -> [todaysDataModel] {
        return [todaysDataModel(image: ImageLiterals.Card.img_card07, store: "헬로우슬립", title: "LED 오로라 블루투스 스피커 무드등 인기상품임...", sale: "56%", price: "34,900"),
                todaysDataModel(image: ImageLiterals.Card.img_card07, store: "헬로우슬립", title: "LED 오로라 블루투스 스피커 무드등 인기상품임...", sale: "56%", price: "34,900"),
                todaysDataModel(image: ImageLiterals.Card.img_card07, store: "헬로우슬립", title: "LED 오로라 블루투스 스피커 무드등 인기상품임...", sale: "56%", price: "34,900"),
                todaysDataModel(image: ImageLiterals.Card.img_card07, store: "헬로우슬립", title: "LED 오로라 블루투스 스피커 무드등 인기상품임...", sale: "56%", price: "34,900"),
        ]
    }
}
