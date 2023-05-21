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
        label.font = .NotoMedium(size: 13)
        label.textColor = .black
        return label
    }()
    
    private let saleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .NotoBold(size: 13)
        label.textColor = .main
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .NotoBold(size: 13)
        label.textColor = .black
        return label
    }()
    
    private let rankView = Top10CollectionViewCell().rankView
    
    private let rankLabel = Top10CollectionViewCell().rankLabel
    
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
        contentView.addSubviews(bestSellerImageView, titleLabel, saleLabel, priceLabel, rankView, rankLabel)
        
        bestSellerImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(bestSellerImageView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
        }
        
        saleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalTo(30)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalTo(saleLabel.snp.trailing)
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
    
    func configureCell(_ bestData: BestSellerDataModel) {
        bestSellerImageView.image = bestData.image
        rankLabel.text = "\(bestData.rank)"
        titleLabel.text = bestData.title
        saleLabel.text = bestData.sale
        priceLabel.text = bestData.price
    }
}
