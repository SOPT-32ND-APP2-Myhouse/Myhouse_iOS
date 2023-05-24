//
//  BannerCollectionViewCell.swift
//  Myhouse
//
//  Created by Kim Min Joo on 2023/05/21.
//

import UIKit

import SnapKit

final class BannerCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {

    static var isFromNib: Bool = false

    // MARK: - UI Components

    private let bannerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = ImageLiterals.Home.banner
        return imageView
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

extension BannerCollectionViewCell {

    private func setLayout() {
        contentView.addSubviews(bannerImage)

        bannerImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
