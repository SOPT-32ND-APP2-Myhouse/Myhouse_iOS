//
//  DetailTableFirstSectionView.swift
//  Myhouse
//
//  Created by 홍준혁 on 2023/05/23.
//

import UIKit

import SnapKit

final class DetailTableFirstSectionView: BaseView {
    
    let introSizeTextLabel: UILabel = {
        let label = UILabel()
        label.text = "20평대 | 내추럴 스타일 | 아파트"
        label.textColor = .darkGray
        label.font = .NotoRegular(size: 12)
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
