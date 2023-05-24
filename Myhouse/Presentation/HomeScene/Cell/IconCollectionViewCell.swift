//
//  IconCollectionViewCell.swift
//  Myhouse
//
//  Created by Minjoo Kim on 2023/05/17.
//

import UIKit

import SnapKit

class IconCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let iconImageView: UIImageView? = {
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
        label.textColor = .darkGray
        return label
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .NotoMedium(size: 12)
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

extension IconCollectionViewCell {

    private func setLayout() {
        contentView.addSubviews(iconImageView!, titleLabel, descriptionLabel)
        
        iconImageView!.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.iconImageView!.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func configureCell(_ iconData: iconDataModel) {
        iconImageView!.image = iconData.image
        titleLabel.text = iconData.title
        descriptionLabel.text = iconData.description
    }

}
