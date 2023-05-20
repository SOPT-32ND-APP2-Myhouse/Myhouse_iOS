//
//  FeedCollectionViewCell.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/19.
//

import UIKit

final class FeedCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private lazy var lookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var severalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Common.icn_several
        return imageView
    }()
    
    private lazy var scrapButton = ScrapButton()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .NotoRegular(size: 12)
        label.numberOfLines = 0
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

extension FeedCollectionViewCell {
    
    private func setLayout() {
        contentView.addSubviews(lookImageView,
                                severalImageView,
                                scrapButton,
                                titleLabel)
        
        lookImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenWidth * 230 / 375)
        }
        
        severalImageView.snp.makeConstraints {
            $0.top.equalTo(lookImageView.snp.top).offset(4)
            $0.trailing.equalTo(lookImageView.snp.trailing).offset(-4)
            $0.size.equalTo(24)
        }
        
        scrapButton.snp.makeConstraints {
            $0.bottom.equalTo(lookImageView.snp.bottom).offset(-4)
            $0.trailing.equalTo(lookImageView.snp.trailing).offset(-4)
            $0.size.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(lookImageView.snp.bottom).offset(4)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func configureCell(_ lookData: LookDataModel) {
        lookImageView.image = lookData.image
        titleLabel.text = lookData.title
    }
}
