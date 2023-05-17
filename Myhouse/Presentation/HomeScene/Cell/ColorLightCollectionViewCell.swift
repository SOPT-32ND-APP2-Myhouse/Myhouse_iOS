//
//  ColorLightCollectionViewCell.swift
//  Myhouse
//
//  Created by Minjoo Kim on 2023/05/16.
//

import UIKit

import SnapKit

final class ColorLightCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let colorLightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private let userLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .NotoBold(size: 12)
        label.textColor = .white
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
        contentView.addSubviews(colorLightImageView,
                                userLabel,
                                bookmarkButton)
        
        colorLightImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        userLabel.snp.makeConstraints {
            $0.leading.equalTo(colorLightImageView.snp.leading).inset(10)
            $0.bottom.equalTo(colorLightImageView.snp.bottom).inset(10)
            $0.width.equalTo(colorLightImageView.snp.width)
        }

        bookmarkButton.snp.makeConstraints {
            $0.bottom.trailing.equalTo(colorLightImageView).inset(8)
            $0.size.equalTo(24)
        }
    }
    
    func configureCell(_ colorLightDummy: ColorLightDataModel) {
        colorLightImageView.image = colorLightDummy.image
        userLabel.text = colorLightDummy.user
    }
}
