//
//  LookView.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/22.
//

import UIKit

final class LookView: BaseView {
    
    // MARK: - UI Components
    
    private lazy var lookPagingTabBarView = LookPagingTabBarView()
    private lazy var lookPagingView = LookingPagingView()
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setDelegate()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setLayout() {
        self.addSubviews(lookPagingTabBarView, lineView, lookPagingView)
        
        lookPagingTabBarView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(lookPagingTabBarView.snp.bottom)
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview()
        }
        
        lookPagingView.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(5)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

private extension LookView {
    func setDelegate() {
        lookPagingTabBarView.delegate = self
        lookPagingView.pagingTabBar.delegate = self
        lookPagingView.pagingTabBar.tabBarcollectionView = lookPagingTabBarView.tabBarcollectionView
    }
}

extension LookView: PagingDelegate {
    func didTapPagingTabBarCell(scrollTo indexPath: IndexPath) {
        lookPagingView.didTapPagingTabBarCell(scrollTo: indexPath)
    }
}
