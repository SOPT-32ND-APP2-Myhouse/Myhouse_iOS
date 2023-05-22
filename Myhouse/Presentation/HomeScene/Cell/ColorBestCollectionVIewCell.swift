//
//  ColorBestCollectionVIewCell.swift
//  Myhouse
//
//  Created by Minjoo Kim on 2023/05/16.
//

import UIKit

import SnapKit

final class ColorBestCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let todaysImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let storeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .NotoRegular(size: 10)
        label.textColor = .darkGray
        return label
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
        label.font = .NotoBold(size: 12)
        label.textColor = .main
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .NotoBold(size: 12)
        label.textColor = .black
        return label
    }()
    
    private let bookmarkButton = BestCollectionViewCell().bookmarkButton
    
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

extension ColorBestCollectionViewCell {
    
    private func setLayout() {
        contentView.addSubviews(todaysImageView,
                                storeLabel,
                                titleLabel,
                                saleLabel,
                                priceLabel)
        
        todaysImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        storeLabel.snp.makeConstraints {
            $0.top.equalTo(todaysImageView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(storeLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        saleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.width.equalTo(27)
            $0.leading.equalToSuperview()
        }
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.width.equalTo(50)
            $0.leading.equalTo(saleLabel.snp.trailing).offset(3)
        }
    }
    
    func configureCell(_ todaysDummy: TodaysDataModel) {
        todaysImageView.image = todaysDummy.image
        storeLabel.text = todaysDummy.store
        titleLabel.text = todaysDummy.title
        saleLabel.text = todaysDummy.sale
        priceLabel.text = todaysDummy.price
    }
}
