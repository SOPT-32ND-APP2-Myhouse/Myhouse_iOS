//
//  TodayRecommendCollectionView.swift
//  Myhouse
//
//  Created by 홍준혁 on 2023/05/24.
//

import UIKit

import SnapKit

final class TodayRecommendCollectionView: UIView {
    
    private enum Size {
        static let collectionHorizontalSpacing: CGFloat = 12
        static let collectionVerticalSpacing: CGFloat = 0
        static let cellWidth: CGFloat = 126
        static let cellHeight: CGFloat = 250
        static let collectionInsets = UIEdgeInsets(
            top: collectionVerticalSpacing,
            left: collectionHorizontalSpacing,
            bottom: collectionVerticalSpacing,
            right: collectionHorizontalSpacing)
    }
    
    // MARK: - property
    
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = Size.collectionInsets
        flowLayout.itemSize = CGSize(width: Size.cellWidth, height: Size.cellHeight)
        return flowLayout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.register(TodayRecommendCollectionViewCell.self,
            forCellWithReuseIdentifier: TodayRecommendCollectionViewCell.className)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render() {
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension TodayRecommendCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayRecommendCollectionViewCell.className, for: indexPath) as? TodayRecommendCollectionViewCell else {
            assert(false, "Wrong Cell")
            return UICollectionViewCell()
        }
        return cell
    }
}
