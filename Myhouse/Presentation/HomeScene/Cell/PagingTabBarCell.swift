//
//  PagingTabBarCell.swift
//  Myhouse
//
//  Created by Kim Min Joo on 2023/05/21.
//

import UIKit

import SnapKit

class PagingTabBarCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    static var isFromNib: Bool = false
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .NotoBold(size: 14)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.sizeToFit()
        
        return label
    }()
    
    private lazy var underline: UIView = {
        let view = UIView()
        view.backgroundColor = .main
        view.alpha = 0.0
        
        return view
    }()
    
    override var isSelected: Bool {
        didSet {
            titleLabel.textColor = isSelected ? .main : .darkGray
            underline.alpha = isSelected ? 1.0 : 0.0
        }
    }
    
    func setupView(title: String) {
        setupLayout()
        titleLabel.text = title
    }
}

private extension PagingTabBarCell {
    func setupLayout() {
        
        addSubviews(titleLabel, underline)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        underline.snp.makeConstraints {
            $0.height.equalTo(2.0)
            $0.width.equalTo(titleLabel).offset(14)
            $0.centerX.equalTo(titleLabel.snp.centerX)
            $0.bottom.equalToSuperview()
        }
    }
}
