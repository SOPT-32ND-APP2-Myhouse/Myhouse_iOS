//
//  BestSellerDataModel.swift
//  Myhouse
//
//  Created by Kim Min Joo on 2023/05/21.
//

import UIKit

struct BestSellerDataModel {
    let image: UIImage
    let rank: Int
    let title: String
    let sale: String
    let price: String
    let star: String
    let review: String
}

extension BestSellerDataModel {
    
    static func dummy() -> [BestSellerDataModel] {
        return [BestSellerDataModel(image: ImageLiterals.Card.img_card12,
                                    rank: 1,
                                    title: "첫번째셀첫번째셀첫번째셀첫번째셀첫번째셀첫번째셀",
                                    sale: "56%",
                                    price: "34,900",
                                    star: "4.7",
                                    review: "15,806"),
                BestSellerDataModel(image: ImageLiterals.Card.img_card12,
                                    rank: 2,
                                    title: "두번째셀두번째셀두번째셀두번째셀두번째셀두번째셀",
                                    sale: "56%",
                                    price: "34,900",
                                    star: "4.7",
                                    review: "15,806"),
                BestSellerDataModel(image: ImageLiterals.Card.img_card12,
                                    rank: 3,
                                    title: "세번째셀세번째셀세번째셀세번째셀세번째셀세번째셀",
                                    sale: "56%",
                                    price: "34,900",
                                    star: "4.7",
                                    review: "15,806")]
        
    }
}
