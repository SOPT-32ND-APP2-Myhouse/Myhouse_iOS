//
//  ScrapCollectionViewCell.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/15.
//

import UIKit

import SnapKit

final class ScrapCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let imageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 6
        imageView.layer.maskedCorners = [.layerMinXMinYCorner]
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let imageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 6
        imageView.layer.maskedCorners = [.layerMaxXMinYCorner]
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let imageView3: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 6
        imageView.layer.maskedCorners = [.layerMinXMaxYCorner]
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let imageView4: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 6
        imageView.layer.maskedCorners = [.layerMaxXMaxYCorner]
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let horizontalStackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let horizontalStackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let allStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 2
        return stackView
    }()
    
    private let folderNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .NotoMedium(size: 14)
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

extension ScrapCollectionViewCell {
    
    private func setLayout() {
        contentView.addSubviews(imageView1,
                                imageView2,
                                imageView3,
                                imageView4,
                                horizontalStackView1,
                                horizontalStackView2,
                                allStackView,
                                folderNameLabel)
        
        horizontalStackView1.addSubviews(imageView1, imageView2)
        horizontalStackView2.addSubviews(imageView3, imageView4)
        allStackView.addSubviews(horizontalStackView1, horizontalStackView2)
        
        imageView1.snp.makeConstraints {
            $0.size.equalTo(SizeLiterals.Screen.screenWidth * 89 / 390)
            $0.leading.equalToSuperview()
        }

        imageView2.snp.makeConstraints {
            $0.size.equalTo(SizeLiterals.Screen.screenWidth * 89 / 390)
            $0.trailing.equalToSuperview()
        }

        imageView3.snp.makeConstraints {
            $0.size.equalTo(SizeLiterals.Screen.screenWidth * 89 / 390)
            $0.leading.equalToSuperview()
        }

        imageView4.snp.makeConstraints {
            $0.size.equalTo(SizeLiterals.Screen.screenWidth * 89 / 390)
            $0.trailing.equalToSuperview()
        }

        horizontalStackView1.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalTo(contentView.snp.width)
            $0.height.equalTo(imageView3.snp.width)
        }
        
        horizontalStackView2.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.width.equalTo(contentView.snp.width)
            $0.height.equalTo(imageView3.snp.width)
        }
        
        allStackView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(contentView.snp.width)
        }
        
        folderNameLabel.snp.makeConstraints {
            $0.top.equalTo(allStackView.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
        }
    }
    
    func configureCell(_ scrapData: ScrapDataModel) {
        imageView1.image = scrapData.image[0]
        imageView2.image = scrapData.image[1]
        imageView3.image = scrapData.image[2]
        imageView4.image = scrapData.image[3]
        folderNameLabel.text = scrapData.title
    }
}
