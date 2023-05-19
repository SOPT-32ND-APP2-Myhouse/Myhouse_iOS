//
//  LookDataModel.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/19.
//

import UIKit

struct LookDataModel {
    let image: UIImage
    let title: String
}

extension LookDataModel {
    static func dummy() -> [LookDataModel] {
        return [LookDataModel(image: ImageLiterals.Card.img_card01,
                              title: "좁은 세탁실, 딱 세 가지로 깔끔한 수납공간으로 대변신"),
                LookDataModel(image: ImageLiterals.Card.img_card01,
                                      title: "좁은 세탁실, 딱 세 가지로 깔끔한 수납공간으로 대변신"),
                LookDataModel(image: ImageLiterals.Card.img_card01,
                                      title: "좁은 세탁실, 딱 세 가지로 깔끔한 수납공간으로 대변신"),
                LookDataModel(image: ImageLiterals.Card.img_card01,
                                      title: "좁은 세탁실, 딱 세 가지로 깔끔한 수납공간으로 대변신"),
                LookDataModel(image: ImageLiterals.Card.img_card01,
                                      title: "좁은 세탁실, 딱 세 가지로 깔끔한 수납공간으로 대변신"),
                LookDataModel(image: ImageLiterals.Card.img_card01,
                                      title: "좁은 세탁실, 딱 세 가지로 깔끔한 수납공간으로 대변신"),
                LookDataModel(image: ImageLiterals.Card.img_card01,
                                      title: "좁은 세탁실, 딱 세 가지로 깔끔한 수납공간으로 대변신")
        ]
    }
}
