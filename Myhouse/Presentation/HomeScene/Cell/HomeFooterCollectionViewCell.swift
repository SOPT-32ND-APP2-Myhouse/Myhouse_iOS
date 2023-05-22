//
//  HomeFooterCollectionViewCell.swift
//  Myhouse
//
//  Created by Kim Min Joo on 2023/05/22.
//

import UIKit

import SnapKit

final class HomeFooterCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    public let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .NotoBold(size: 12)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    public let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .NotoMedium(size: 12)
        label.textColor = .darkGray
        label.textAlignment = .center
        
        return label
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        backgroundColor = .gray_20
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.gray.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension HomeFooterCollectionViewCell {

    private func setLayout() {
        contentView.addSubviews(imageView,
                                titleLabel,
                                descriptionLabel)
        
        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(30)
            $0.height.equalTo(35)
            $0.bottom.equalToSuperview().inset(103)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(23)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(imageView.snp.leading)
            $0.trailing.equalTo(imageView.snp.trailing)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(7)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(28)
        }
    }
    
    func configureCell(_ footerData: HomeFooterDataModel) {
        imageView.image = footerData.image
        titleLabel.text = footerData.title
        descriptionLabel.text = footerData.description
    }
}
