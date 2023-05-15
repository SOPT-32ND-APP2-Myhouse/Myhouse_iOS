//
//  HomeView.swift
//  Myhouse
//
//  Created by Minjoo Kim on 2023/05/15.
//

import UIKit

import SnapKit

final class HomeView: BaseView {
    
    private typealias SectionType = AboutSection
    
    @frozen
    private enum AboutSection: CaseIterable {
        case best, recommend
    }
    
    // MARK: - UI Components
    
    private let bestDummy = bestDataModel.dummy()
    private let recommendDummy = recommendDataModel.dummy()
    
    private lazy var homeCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.getLayout())
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.collectionViewLayout = self.getLayout()
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        registerCell()
        setDataSource()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setDataSource() {
        homeCollectionView.dataSource = self
    }
    
    override func setLayout() {
        self.addSubviews(homeCollectionView)
        
        homeCollectionView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalToSuperview()
        }
    }
}

// MARK: - Extensions

extension HomeView {
    func registerCell() {
        SectionTitleCollectionReusableView.register(target: homeCollectionView)
        DivisionFooterView.register(target: homeCollectionView)
        
        BestCollectionViewCell.register(target: homeCollectionView)
        RecommendCollectionViewCell.register(target: homeCollectionView)
    }
    
    func getLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, env -> NSCollectionLayoutSection? in
            let sectionType = SectionType.allCases[sectionIndex]
            switch sectionType {
            case .best:
                return self.getLayoutBestSection()
            case .recommend:
                return self.getLayoutRecommendSection()
            }
        }
    }
    

    func getLayoutBestSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.4),
            heightDimension: .absolute(230)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(40)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        let footerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(30)
        )
        
        let footer = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerSize,
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottom
        )
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [header, footer]
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        section.interGroupSpacing = 8
        return section
    }
    
    
    func getLayoutRecommendSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.489),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(240)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        group.interItemSpacing = .fixed(8)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(35)
        )
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )

        let footerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(30)
        )
        
        let footer = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerSize,
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottom
        )

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        section.boundarySupplementaryItems = [header, footer]
        section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        section.interGroupSpacing = 8
        return section
    }
    
}

extension HomeView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return AboutSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = SectionType.allCases[section]
        switch sectionType {
        case .best:
            return bestDummy.count
        case .recommend:
            return recommendDummy.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = SectionType.allCases[indexPath.section]
        switch sectionType {
        case .best:
            let cell = BestCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(bestDummy[indexPath.item])
            return cell
        case .recommend:
            let cell = RecommendCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(recommendDummy[indexPath.item])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionType = SectionType.allCases[indexPath.section]
        
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = SectionTitleCollectionReusableView.dequeueReusableHeaderView(collectionView: collectionView, indexPath: indexPath)
            switch sectionType {
            case .best:
                headerView.setSectionTitle(text: I18N.HomeSection.best)
            case .recommend:
                headerView.setSectionTitle(text: I18N.HomeSection.recommend1)
            }
            return headerView
        }
        else if kind == UICollectionView.elementKindSectionFooter {
            let footerView = DivisionFooterView.dequeueReusableFooterView(collectionView: collectionView, indexPath: indexPath)

            return footerView
        }
        else { return UICollectionReusableView() }
        
    }

}
