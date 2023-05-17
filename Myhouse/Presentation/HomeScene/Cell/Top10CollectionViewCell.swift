//
//  Top10CollectionViewCell.swift
//  Myhouse
//
//  Created by Kim Min Joo on 2023/05/16.
//

import UIKit

import SnapKit

final class Top10CollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
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
    
    private let rankView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Home.icn_rank
        return imageView
    }()
    
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .NotoBold(size: 12)
        label.textAlignment = .center
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

extension Top10CollectionViewCell {
    
    private func setLayout() {
        contentView.addSubviews(colorLightImageView,
                                userLabel,
                                bookmarkButton,
                                rankView,
                                rankLabel)
        
        colorLightImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        userLabel.snp.makeConstraints {
            $0.leading.equalTo(colorLightImageView.snp.leading).inset(10)
            $0.bottom.equalTo(colorLightImageView.snp.bottom).inset(10)
        }

        bookmarkButton.snp.makeConstraints {
            $0.bottom.trailing.equalTo(colorLightImageView).inset(8)
            $0.size.equalTo(24)
        }
        
        rankView.snp.makeConstraints {
            $0.top.equalTo(colorLightImageView.snp.top)
            $0.leading.equalToSuperview().inset(10)
            $0.width.equalTo(23)
            $0.height.equalTo(26)
        }
        
        rankLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalTo(rankView.snp.centerX)
            $0.size.equalTo(20)
        }
    }
    
    func configureCell(_ colorLightDummy: colorLightDataModel) {
        colorLightImageView.image = colorLightDummy.image
        userLabel.text = colorLightDummy.user
        rankLabel.text = "\(colorLightDummy.rank ?? 0)"
        
    }
}
