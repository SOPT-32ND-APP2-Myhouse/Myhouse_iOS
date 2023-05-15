//
//  MoreButton.swift
//  Myhouse
//
//  Created by Kim Min Joo on 2023/05/16.
//

import UIKit

import SnapKit

final class MoreButtonFooterView: UICollectionReusableView, UICollectionFooterViewRegisterable {
    
    // MARK: - Properties
    
    static var isFromNib = false
    
    static let reuseIdentifier = "moreButton-footer"
    
    // MARK: - UI Components

    private let moreButton: UIButton = {
        let button = UIButton()
        button.setTitle("더보기 >", for: .normal)
        button.titleLabel?.font = .NotoBold(size: 13)
        return button
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

private extension MoreButtonFooterView {

    func setLayout() {
        addSubviews(moreButton)
        
        moreButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(44)
        }
    }
}
