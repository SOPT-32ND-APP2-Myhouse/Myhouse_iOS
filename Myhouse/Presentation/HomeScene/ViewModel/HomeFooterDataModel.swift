//
//  HomeFooterDataModel.swift
//  Myhouse
//
//  Created by Kim Min Joo on 2023/05/22.
//

import UIKit

struct HomeFooterDataModel {
    let image: UIImage?
    let title: String
    let description: String
}

extension HomeFooterDataModel {
    static func dummy() -> [HomeFooterDataModel] {
        return [HomeFooterDataModel(image: ImageLiterals.Home.icn_home01, title: "친구 초대", description: "5000포인트\n선물까지!"),
                HomeFooterDataModel(image: ImageLiterals.Home.icn_home02, title: "오늘의 집 스토리", description: "오늘의집이\n궁금해요"),
                HomeFooterDataModel(image: ImageLiterals.Home.icn_home03, title: "고객센터", description: "1670-0876\n09:00~18:00"),
                HomeFooterDataModel(image: nil, title: "전문가 회원 가입", description: "인테리어 전문가님들!\n오늘의집과 함께하세요."),
                HomeFooterDataModel(image: nil, title: "사업자 구매 회원 전환", description: "사업자 구매 회원에게\n혜택을 드립니다.")
        ]
    }
}
