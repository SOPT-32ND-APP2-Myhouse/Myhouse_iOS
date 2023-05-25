//
//  RecommendCollectionViewCell.swift
//  Myhouse
//
//  Created by 홍준혁 on 2023/05/24.
//

import UIKit

import SnapKit

final class TodayRecommendCollectionViewCell: UICollectionViewCell {
    
    let titleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Card.img_card06
        return imageView
    }()
    
    let subImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Common.btn_bookMarkDefault_big
        return imageView
    }()
    
    let makerLable: UILabel = {
        let label = UILabel()
        label.text = "우드레이"
        label.textColor = .darkGray
        label.font = .NotoMedium(size: 10)
        return label
    }()
    
    let productLable: UILabel = {
        let label = UILabel()
        label.text = "홈카페 원형 식탁 테이블\n800size"
        label.numberOfLines = 2
        label.textColor = .black
        label.font = .NotoRegular(size: 12)
        return label
    }()
    
    let saleRateLable: UILabel = {
        let label = UILabel()
        label.text = "60%"
        label.textColor = .main
        label.font = .NotoBold(size: 16)
        return label
    }()
    
    let priceLable: UILabel = {
        let label = UILabel()
        label.text = "74,800"
        label.textColor = .black
        label.font = .NotoBold(size: 16)
        return label
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
        
        self.addSubview(contentView)
        
        contentView.addSubviews(
            titleImage,
            subImage,
            makerLable,
            productLable,
            saleRateLable,
            priceLable
        )
        
        titleImage.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(126)
        }
        
        subImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(96)
            $0.trailing.equalToSuperview().inset(6)
            $0.height.width.equalTo(24)
        }
        
        makerLable.snp.makeConstraints {
            $0.top.equalTo(titleImage.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
        }
        
        productLable.snp.makeConstraints {
            $0.top.equalTo(makerLable.snp.bottom).offset(4)
            $0.leading.equalToSuperview()
        }
        
        saleRateLable.snp.makeConstraints {
            $0.top.equalTo(productLable.snp.bottom).offset(3)
            $0.leading.equalToSuperview()
        }
        
        priceLable.snp.makeConstraints {
            $0.top.equalTo(productLable.snp.bottom).offset(3)
            $0.leading.equalTo(saleRateLable.snp.trailing).offset(4)
        }

    }
    
    func configUI() {
        // View Configuration
        self.backgroundColor = .white
    }
}
