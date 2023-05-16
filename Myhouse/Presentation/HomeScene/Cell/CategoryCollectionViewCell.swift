//
//  CategoryCollectionViewCell.swift
//  Myhouse
//
//  Created by Minjoo Kim on 2023/05/16.
//

import UIKit

import SnapKit

class CategoryCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
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

extension CategoryCollectionViewCell {

    
    private func setLayout() {
        contentView.addSubviews(categoryImageView, titleLabel)
        
        categoryImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.height.equalTo(74)
            $0.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(categoryImageView.snp.bottom).inset(-8)
            $0.width.equalTo(categoryImageView.snp.width)
            $0.height.equalTo(17)
            $0.centerX.equalToSuperview()
        }
    }
    
    func configureCell(_ categoryData: categoryDataModel) {
        categoryImageView.image = categoryData.image
        titleLabel.text = categoryData.title
    }

}