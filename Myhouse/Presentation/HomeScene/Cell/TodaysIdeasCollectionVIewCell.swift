//
//  TodaysIdeasCollectionVIewCell.swift
//  Myhouse
//
//  Created by Minjoo Kim on 2023/05/17.
//

import UIKit

import SnapKit

class TodaysIdeasCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let ideasImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .NotoMedium(size: 14)
        label.textColor = .black
        return label
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = .NotoBold(size: 14)
        label.textColor = .black
        label.sizeToFit()
        return label
    }()
    private let productsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = .NotoMedium(size: 12)
        label.textColor = .gray
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

extension TodaysIdeasCollectionViewCell {

    private func setLayout() {
        contentView.addSubviews(ideasImageView, titleLabel, descriptionLabel, productsLabel)
        
        ideasImageView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(ideasImageView.snp.trailing).inset(10)
            $0.trailing.equalToSuperview()
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).inset(-8)
            $0.leading.equalTo(ideasImageView.snp.trailing).inset(10)
            $0.trailing.equalToSuperview()
        }
        productsLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).inset(-5)
            $0.leading.equalTo(ideasImageView.snp.trailing).inset(10)
            $0.trailing.equalToSuperview()
        }
    }
    
    func configureCell(_ ideaData: ideaDataModel) {
        ideasImageView.image = ideaData.image
        titleLabel.text = ideaData.title
        descriptionLabel.text = ideaData.description
        productsLabel.text = ideaData.products
    }

}
