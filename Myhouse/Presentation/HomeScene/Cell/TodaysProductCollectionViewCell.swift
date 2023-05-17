//
//  TodaysProductCollectionViewCell.swift
//  Myhouse
//
//  Created by Kim Min Joo on 2023/05/16.
//

import UIKit

import SnapKit

class TodaysProductCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    
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
        label.font = .NotoMedium(size: 10)
        label.textColor = .darkGray
        return label
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .NotoRegular(size: 13)
        label.textColor = .black
        return label
    }()
    private let saleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .NotoBold(size: 15)
        label.textColor = .main
        return label
    }()
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .NotoBold(size: 15)
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

extension TodaysProductCollectionViewCell {

    
    private func setLayout() {
        contentView.addSubviews(todaysImageView, storeLabel, titleLabel, saleLabel, priceLabel)
        
        todaysImageView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        
        storeLabel.snp.makeConstraints {
            $0.top.equalTo(todaysImageView.snp.bottom).inset(-8)
            $0.leading.trailing.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(storeLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        saleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.width.equalTo(36)
            $0.leading.equalToSuperview()
        }
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.width.equalTo(60)
            $0.leading.equalTo(saleLabel.snp.trailing).inset(-3)
        }
    }
    
    func configureCell(_ todaysDummy: todaysDataModel) {
        todaysImageView.image = todaysDummy.image
        storeLabel.text = todaysDummy.store
        titleLabel.text = todaysDummy.title
        saleLabel.text = todaysDummy.sale
        priceLabel.text = todaysDummy.price
        
    }

}
