//
//  TopCategoryCollectionViewCell.swift
//  Myhouse
//
//  Created by Kim Min Joo on 2023/05/21.
//

import UIKit

import SnapKit

final class TopCategoryCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .NotoRegular(size: 12)
        label.textColor = .black
        label.textAlignment = .center
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

extension TopCategoryCollectionViewCell {
    
    private func setLayout() {
        contentView.addSubviews(categoryImageView, titleLabel)
        
        categoryImageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(categoryImageView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(-5)
            
        }
    }
    
    func configureCell(_ topCategoryData: TopCategoryDataModel) {
        categoryImageView.image = topCategoryData.image
        titleLabel.text = topCategoryData.title
    }
}
