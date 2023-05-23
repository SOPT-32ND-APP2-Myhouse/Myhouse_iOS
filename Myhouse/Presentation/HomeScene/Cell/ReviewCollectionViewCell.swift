//
//  ReviewCollectionViewCell.swift
//  Myhouse
//
//  Created by Minjoo Kim on 2023/05/17.
//

import UIKit

import SnapKit

final class ReviewCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let reviewImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .NotoBold(size: 12)
        label.textColor = .black
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = .NotoRegular(size: 14)
        label.textColor = .black
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

extension ReviewCollectionViewCell {

    private func setLayout() {
        contentView.addSubviews(reviewImageView,
                                titleLabel,
                                descriptionLabel)
        
        reviewImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(reviewImageView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func configureCell(_ reviewData: RecommendDataModel) {
        reviewImageView.image = reviewData.image
        titleLabel.text = reviewData.highlight
        descriptionLabel.text = reviewData.title
    }
}
