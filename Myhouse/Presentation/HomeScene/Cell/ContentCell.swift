//
//  ContentCell.swift
//  Myhouse
//
//  Created by Kim Min Joo on 2023/05/21.
//

import UIKit

import SnapKit

final class ContentCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let bestSellerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .NotoRegular(size: 10)
        label.textColor = .black
        return label
    }()
    
    private let saleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .NotoBold(size: 10)
        label.textColor = .main
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .NotoBold(size: 10)
        label.textColor = .black
        return label
    }()
    
    private let rankView = Top10CollectionViewCell().rankView
    
    private let rankLabel = Top10CollectionViewCell().rankLabel
    
    private let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Home.img_star
        return imageView
    }()
    
    public let starLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .NotoBold(size: 10)
        label.sizeToFit()
        return label
    }()
    
    public let reviewLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .NotoBold(size: 10)
        label.sizeToFit()
        return label
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension ContentCell {
    
    private func setLayout() {
        contentView.addSubviews(bestSellerImageView,
                                titleLabel,
                                saleLabel,
                                priceLabel,
                                starImageView,
                                starLabel,
                                reviewLabel,
                                rankView,
                                rankLabel)
        
        bestSellerImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(bestSellerImageView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
        }
        
        saleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
            $0.width.equalTo(30)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(saleLabel.snp.trailing)
        }
        
        starImageView.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
        }
        
        starLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(5)
            $0.leading.equalTo(starImageView.snp.trailing).offset(2)
        }
        
        reviewLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(5)
            $0.leading.equalTo(starLabel.snp.trailing).offset(4)
        }
        
        rankView.snp.makeConstraints {
            $0.top.equalTo(bestSellerImageView.snp.top)
            $0.leading.equalToSuperview().inset(10)
            $0.width.equalTo(23)
            $0.height.equalTo(26)
        }
        
        rankLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalTo(rankView.snp.centerX)
            $0.size.equalTo(20)
        }
    }
    
    func configureCell(_ bestSellerData: BestSellerDataModel) {
        bestSellerImageView.image = bestSellerData.image
        rankLabel.text = "\(bestSellerData.rank)"
        titleLabel.text = bestSellerData.title
        saleLabel.text = bestSellerData.sale
        priceLabel.text = bestSellerData.price
        starLabel.text = bestSellerData.star
        reviewLabel.text = "리뷰 \(bestSellerData.review)"
        
    }
}
