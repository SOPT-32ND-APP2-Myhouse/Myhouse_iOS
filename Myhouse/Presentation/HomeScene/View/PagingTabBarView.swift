//
//  PagingTabBarView.swift
//  Myhouse
//
//  Created by Kim Min Joo on 2023/05/21.
//

import UIKit
import SnapKit

protocol PagingDelegate: AnyObject {
    func didTapPagingTabBarCell(scrollTo indexPath: IndexPath)
}

class PagingTabBarView: UIView {
    
    private var categoryTitleList: [String]
    
    weak var delegate: PagingDelegate?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 1 * 2.0) / 5.0, height: 20)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    init(categoryTitleList: [String]) {
        self.categoryTitleList = categoryTitleList
        super.init(frame: .zero)
        setLayout()
        setRegister()
        setDelegate()
        collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: [])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PagingTabBarView {
    
    func setRegister() {
        PagingTabBarCell.register(target: collectionView)
    }
    
    func setDelegate() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setLayout() {
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension PagingTabBarView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didTapPagingTabBarCell(scrollTo: indexPath)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let name = self.categoryTitleList[indexPath.row]
        
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
        
        let nameSize = (name as NSString).size(withAttributes: attributes as [NSAttributedString.Key: Any])
        return CGSize(width: nameSize.width + 18, height: 30)
    }
}

extension PagingTabBarView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryTitleList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = PagingTabBarCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
        cell.setupView(title: categoryTitleList[indexPath.row])
        
        return cell
    }
}
