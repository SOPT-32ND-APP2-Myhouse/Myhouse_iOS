//
//  DetailTableSecondSectionView.swift
//  Myhouse
//
//  Created by 홍준혁 on 2023/05/23.
//

import UIKit

import SnapKit

final class DetailTableSecondSectionView: BaseView {
    
    let introSizeTextLabel: UILabel = {
        let label = UILabel()
        label.text = "식물들 창가로 몰아주기"
        label.textColor = .black
        label.font = .NotoRegular(size: 14)
        return label
    }()
    
    override func setUI() {
        self.addSubview(introSizeTextLabel)
        
        introSizeTextLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
        }
    }
}
