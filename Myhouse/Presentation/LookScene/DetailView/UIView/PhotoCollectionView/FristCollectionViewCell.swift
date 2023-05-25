//
//  fristCollectionViewCell.swift
//  Myhouse
//
//  Created by 홍준혁 on 2023/05/24.
//

import UIKit

import SnapKit

final class FristCollectionViewCell: UICollectionViewCell {
    
    let titleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Card.img_card05
        return imageView
    }()
    
    let rightImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Common.icn_several
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
    func render() {
        // Override Layout
        self.addSubviews(
            titleImage,
            rightImage
        )
        
        titleImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        rightImage.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(4)
            $0.height.width.equalTo(24)
        }
    }
    
    func configUI() {
        // View Configuration
        self.backgroundColor = .white
    }
}
