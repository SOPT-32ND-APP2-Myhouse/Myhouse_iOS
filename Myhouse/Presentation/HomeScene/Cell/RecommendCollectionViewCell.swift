//
//  RecommendCollectionViewCell.swift
//  Myhouse
//
//  Created by Minjoo Kim on 2023/05/15.
//

import UIKit

import SnapKit

class RecommendCollectionViewCell: UICollectionViewCell {
    
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let recommendImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemGray
        imageView.layer.cornerRadius = 4
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .NotoMedium(size: 13)
        label.textColor = .black
        return label
    }()
    
    private let bookmarkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Common.icn_scrapbook
        imageView.tintColor = .systemGray
        return imageView
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

extension RecommendCollectionViewCell {

    
    private func setLayout() {
        contentView.addSubviews(recommendImageView, descriptionLabel, bookmarkImageView)
        
        recommendImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(150)
            $0.height.equalTo(150)
            $0.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(recommendImageView.snp.bottom).inset(-12)
            $0.width.equalTo(recommendImageView.snp.width)
            $0.height.equalTo(44)
            $0.centerX.equalToSuperview()
        }
        bookmarkImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(25)
            $0.height.equalTo(25)
            $0.centerX.equalToSuperview()
        }
    }
    
    func configureCell(_ recommendData: HomeDataModel) {
        recommendImageView.image = recommendData.image
        descriptionLabel.text = recommendData.description
        
    }

}
