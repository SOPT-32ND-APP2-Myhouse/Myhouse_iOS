//
//  iconDataModel.swift
//  Myhouse
//
//  Created by Minjoo Kim on 2023/05/17.
//

import UIKit

struct iconDataModel {
    let image: UIImage?
    let title: String
    let description: String
}

extension iconDataModel {
    static func dummy() -> [iconDataModel] {
        return [iconDataModel(image: ImageLiterals.Home.icn_home01, title: "친구초대", description: "5,000포인트\n선물까지"),
                iconDataModel(image: ImageLiterals.Home.icn_home02, title: "오늘의집 스토리", description: "오늘의집이\n궁금해요"),
                iconDataModel(image: ImageLiterals.Home.icn_home03, title: "고객센터", description: "1670-0876\n09:00~18:00"),
                iconDataModel(image: ImageLiterals.Home.icn_home01, title: "전문가 회원 가입", description: "인테리어 전문가님들!\n 오늘의집과 함께하세요."),
                iconDataModel(image: ImageLiterals.Home.icn_home01, title: "사업자 구매 회원 전환", description: "사업자 구매 회원에게\n혜택을 드립니다.")
        ]
    }
}
