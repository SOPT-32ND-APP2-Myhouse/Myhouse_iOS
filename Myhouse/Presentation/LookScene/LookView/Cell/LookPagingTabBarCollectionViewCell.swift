//
//  LookPagingTabCollectionViewCell.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/22.
//

import UIKit

import SnapKit

final class LookPagingTabBarCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .NotoBold(size: 14)
        label.textAlignment = .center
        label.textColor = .black
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
            titleLabel.textColor = isSelected ? .main : .black
            underline.alpha = isSelected ? 1.0 : 0.0
        }
    }
    
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

extension LookPagingTabBarCollectionViewCell {
    
    private func setLayout() {
        contentView.addSubviews(titleLabel, underline)
        
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
        }
        
        underline.snp.makeConstraints {
            $0.height.equalTo(3)
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalTo(titleLabel.snp.trailing)
            $0.bottom.equalToSuperview()
        }
    }
    
    func setTitle(text: String?) {
        self.titleLabel.text = text
    }
}
