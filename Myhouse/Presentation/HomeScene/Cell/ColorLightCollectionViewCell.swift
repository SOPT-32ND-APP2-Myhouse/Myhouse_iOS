//
//  ColorLightCollectionViewCell.swift
//  Myhouse
//
//  Created by Minjoo Kim on 2023/05/16.
//

import UIKit

import SnapKit

class ColorLightCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let colorLightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        return imageView
    }()
    private let storeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .NotoMedium(size: 10)
        label.textColor = .darkGray
        return label
    }()
    private let userLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .NotoRegular(size: 12)
        label.textColor = .white
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

extension ColorLightCollectionViewCell {

    
    private func setLayout() {
        contentView.addSubviews(colorLightImageView, userLabel, bookmarkButton)
        
        colorLightImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(163)
            $0.centerX.equalToSuperview()
        }
        
        userLabel.snp.makeConstraints {
            $0.leading.equalTo(colorLightImageView.snp.leading).inset(10)
            $0.bottom.equalTo(colorLightImageView.snp.bottom).inset(10)
            $0.width.equalTo(colorLightImageView.snp.width)
            $0.height.equalTo(18)
        }

        bookmarkButton.snp.makeConstraints {
            $0.bottom.trailing.equalTo(colorLightImageView).inset(8)
            $0.width.equalTo(24)
            $0.height.equalTo(24)
        }
    }
    
    func configureCell(_ colorLightDummy: colorLightDataModel) {
        colorLightImageView.image = colorLightDummy.image
        userLabel.text = colorLightDummy.user
        
    }

}