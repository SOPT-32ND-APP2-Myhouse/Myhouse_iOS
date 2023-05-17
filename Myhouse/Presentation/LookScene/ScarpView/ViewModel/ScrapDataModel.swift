//
//  FolderDataModel.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/17.
//

import UIKit

struct ScrapDataModel {
    let image: [UIImage]
    let title: String
}

extension ScrapDataModel {
    static func dummy() -> [ScrapDataModel] {
        return [ScrapDataModel(image: [ImageLiterals.Card.img_card13,
                                        ImageLiterals.Card.img_card14,
                                        ImageLiterals.Card.img_card18,
                                        ImageLiterals.Card.img_card19],
                                title: "모든 게시물"),
                ScrapDataModel(image: [ImageLiterals.Card.img_card13,
                                        ImageLiterals.Card.img_card17,
                                        ImageLiterals.Card.img_card18,
                                        ImageLiterals.Card.img_card19],
                                title: "내 취향 인테리어"),
                ScrapDataModel(image: [ImageLiterals.Card.img_card13,
                                        ImageLiterals.Card.img_card17,
                                        ImageLiterals.Card.img_card18,
                                        ImageLiterals.Card.img_card19],
                                title: "친구 집들이 선물"),
                ScrapDataModel(image: [ImageLiterals.Card.img_card13,
                                        ImageLiterals.Card.img_card17,
                                        ImageLiterals.Card.img_card18,
                                        ImageLiterals.Card.img_card19],
                                title: "인테리어 꿀팁 모음")
        ]
    }
}
