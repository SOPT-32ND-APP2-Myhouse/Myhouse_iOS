//
//  SimilarBestCollectionViewCell.swift
//  Myhouse
//
//  Created by 홍준혁 on 2023/05/24.
//

import UIKit

import SnapKit

final class SimilarBestCollectionViewCell: UICollectionViewCell {
    
    let titleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Card.img_card06
        return imageView
    }()
    
    let rightImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Common.icn_several
        return imageView
    }()
    
    let subImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Common.btn_bookMarkDefault_big
        return imageView
    }()
    
    let productLable: UILabel = {
        let label = UILabel()
        label.text = "좀은 세탁실, 딱 세 가지로 깔끔한\n수납공간으로 대변신"
        label.numberOfLines = 2
        label.textColor = .black
        label.font = .NotoRegular(size: 12)
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
            rightImage,
            subImage,
            productLable
        )
        
        titleImage.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }

        rightImage.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(4)
            $0.height.width.equalTo(24)
        }
        
        subImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(169)
            $0.trailing.equalToSuperview().inset(7)
            $0.height.width.equalTo(24)
        }
        
        productLable.snp.makeConstraints {
            $0.top.equalTo(titleImage.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func configUI() {
        // View Configuration
        self.backgroundColor = .white
    }
}
