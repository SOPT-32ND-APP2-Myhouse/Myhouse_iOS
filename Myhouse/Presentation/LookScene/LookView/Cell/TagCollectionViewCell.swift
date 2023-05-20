//
//  TagCollectionViewCell.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/18.
//

import UIKit

final class TagCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components

    lazy var tagLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .NotoMedium(size: 12)
        return label
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension TagCollectionViewCell {
    
    private func setUI() {
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 16
        self.backgroundColor = .white
    }
    
    private func setLayout() {
        contentView.addSubviews(tagLabel)
        
        tagLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(12)
        }
    }
}
