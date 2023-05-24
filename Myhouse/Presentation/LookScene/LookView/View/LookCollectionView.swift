//
//  LookCollectionView.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/19.
//

import UIKit

final class LookCollectionView: BaseView {
    
    // MARK: - Properties
    
    private var lookData = LookDataModel.dummy() {
        didSet {
            self.lookCollectionView.reloadData()
        }
    }
    private var allPostData: [AllPostResponseModel] = [] {
        didSet {
            self.lookCollectionView.reloadData()
        }
    }
    
    private typealias SectionType = AboutSection
    
    @frozen
    private enum AboutSection: CaseIterable {
        case tag, feed
    }
    
    // MARK: - UI Components
    
    private lazy var lookCollectionView: UICollectionView = {
        let layout = self.getLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        return collectionView
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        registerCell()
        fetchData()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setLayout() {
        self.addSubviews(lookCollectionView)
        
        lookCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - Extensions

extension LookCollectionView {
    
    func fetchData() {
        getAllPost()
    }
    
    func registerCell() {
        TagCollectionViewCell.register(target: lookCollectionView)
        FeedCollectionViewCell.register(target: lookCollectionView)
    }
    
    func getLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, env -> NSCollectionLayoutSection? in
            let sectionType = SectionType.allCases[sectionIndex]
            switch sectionType {
            case .tag:
                return self.createTagLayout()
            case .feed:
                return self.getLayoutFeedSection()
            }
        }
    }
    
    private func createTagLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .estimated(80),
            heightDimension: .absolute(40)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(500),
            heightDimension: .absolute(40)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.interItemSpacing = .fixed(8)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    func getLayoutFeedSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(SizeLiterals.Screen.screenWidth *   292 / 375)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
        
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
}

extension LookCollectionView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return AboutSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = SectionType.allCases[section]
        switch sectionType {
        case .tag:
            return I18N.Look.tagData.count
        case .feed:
            return allPostData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = SectionType.allCases[indexPath.section]
        switch sectionType {
        case .tag:
            let cell = TagCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.tagLabel.text = I18N.Look.tagData[indexPath.item]
            return cell
        case .feed:
            let cell = FeedCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(allPostData[indexPath.item])
            return cell
        }
    }
}

private extension LookCollectionView {
    
    func getAllPost() {
        PostService.shared.getAllPostAPI { networkResult in
            switch networkResult {
            case .success(let data):
                if let data = data as? GenericResponse<[AllPostResponseModel]> {
                    if let allPostData = data.data {
                        self.allPostData = allPostData
                    }
                }
            default:
                break
            }
        }
    }
}
