//
//  DevisionFooterView.swift
//  Myhouse
//
//  Created by Kim Min Joo on 2023/05/15.
//


import UIKit

import SnapKit

final class DivisionFooterView: UICollectionReusableView, UICollectionFooterViewRegisterable {
    
    // MARK: - Properties
    
    static var isFromNib = false
    
    static let reuseIdentifier = "division-footer"
    
    // MARK: - UI Components

    private let division: UIView = {
        let division = UIView()
        division.backgroundColor = .gray_20
        return division
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

private extension DivisionFooterView {

    func setLayout() {
        addSubviews(division)
        
        division.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(8)
        }
    }
}
