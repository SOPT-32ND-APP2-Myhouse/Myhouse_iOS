//
//  BestSellerCollectionVewCell.swift
//  Myhouse
//
//  Created by Kim Min Joo on 2023/05/21.
//

import UIKit

import SnapKit

class BestSellerCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let line: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let line2: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let categoryTitleList = [ "전체", "가구", "패브릭", "가전 • 디지털", "주방용품", "식품" ]
    
    private lazy var pagingTabBarView = PagingTabBarView(categoryTitleList: categoryTitleList)
    private lazy var pagingView = PagingView(categoryTitleList: categoryTitleList, pagingTabBarView: pagingTabBarView)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension BestSellerCollectionViewCell {
    func setLayout() {
        contentView.addSubviews(line, line2)
        
        [
            pagingTabBarView,
            pagingView
        ].forEach { contentView.addSubview($0) }
        
        line.snp.makeConstraints {
            $0.top.equalTo(contentView.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        line2.snp.makeConstraints {
            $0.top.equalTo(pagingTabBarView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        pagingTabBarView.snp.makeConstraints {
            $0.top.equalTo(line.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(pagingTabBarView.cellHeight)
        }
        
        pagingView.snp.makeConstraints {
            $0.top.equalTo(line2.snp.bottom).offset(26)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
