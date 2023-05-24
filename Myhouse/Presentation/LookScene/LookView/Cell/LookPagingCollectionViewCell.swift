//
//  LookPagingCollectionViewCell.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/22.
//

import UIKit

import SnapKit

final class LookPagingCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    lazy var lookCollectionView = LookCollectionView()
    
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

extension LookPagingCollectionViewCell {
    
    private func setLayout() {
        contentView.addSubviews(lookCollectionView)

        lookCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
