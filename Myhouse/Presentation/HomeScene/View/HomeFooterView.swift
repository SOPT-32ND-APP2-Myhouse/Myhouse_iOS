//
//  HomeFooterView.swift
//  Myhouse
//
//  Created by Kim Min Joo on 2023/05/22.
//

import UIKit

import SnapKit

final class HomeFooterView: UICollectionReusableView, UICollectionFooterViewRegisterable {
    
    // MARK: - Properties
    
    static var isFromNib = false
    
    // MARK: - UI Components
    
    private let footerDummy = HomeFooterDataModel.dummy()
    
    public let moreButton = MoreButtonFooterView().moreButton
    
    private let moreImageView = MoreButtonFooterView().moreImageView
    
    private lazy var footerCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.getLayout())
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.collectionViewLayout = self.getLayout()
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    private let footerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray_20
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.gray.cgColor
        return view
    }()
    
    private let footerLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.font = .NotoRegular(size: 10)
        label.text = I18N.Home.footer
        let fullText = label.text ?? ""
        let attribtuedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: "(주)버킷플레이스")
        let range2 = (fullText as NSString).range(of: "이용약관")
        let range3 = (fullText as NSString).range(of: "개인정보처리방침")
        let range4 = (fullText as NSString).range(of: "|")
        attribtuedString.addAttribute(.foregroundColor, value: UIColor.black, range: range)
        attribtuedString.addAttribute(.font, value: UIFont.NotoBold(size: 10), range: range)
        attribtuedString.addAttribute(.foregroundColor, value: UIColor.darkGray, range: range2)
        attribtuedString.addAttribute(.font, value: UIFont.NotoMedium(size: 10), range: range2)
        attribtuedString.addAttribute(.foregroundColor, value: UIColor.black, range: range3)
        attribtuedString.addAttribute(.font, value: UIFont.NotoMedium(size: 10), range: range3)
        attribtuedString.addAttribute(.foregroundColor, value: UIColor.gray, range: range4)
        label.attributedText = attribtuedString
        return label
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setLayout()
        registerCell()
        setDataSource()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDataSource() {
        footerCollectionView.dataSource = self
    }
}

// MARK: - Extensions

private extension HomeFooterView {
    func registerCell() {
        HomeFooterCollectionViewCell.register(target: footerCollectionView)
    }
    
    func getLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, env -> NSCollectionLayoutSection? in
            return self.getLayoutCollectionView()
        }
    }
    
    func getLayoutCollectionView() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/3),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let itemSize2 = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let item2 = NSCollectionLayoutItem(layoutSize: itemSize2)
        
        let groupSize1 = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(170/272)
        )
        
        let group1 = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize1,
            repeatingSubitem: item,
            count: 3
        )
        
        let groupSize2 = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(102/272)
        )
        
        let group2 = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize2,
            repeatingSubitem: item2,
            count: 2
            
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [group1, group2]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    func setLayout() {
        
        footerView.addSubview(footerLabel)
        addSubviews(moreButton, footerCollectionView, footerView, moreImageView)
        
        moreButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        moreImageView.snp.makeConstraints {
            $0.leading.equalTo(moreButton.titleLabel!.snp.trailing)
            $0.centerY.equalTo(moreButton.snp.centerY)
        }
        
        footerCollectionView.snp.makeConstraints {
            $0.top.equalTo(moreButton.snp.bottom).offset(48)
            $0.leading.trailing.equalToSuperview().inset(-16)
        }
        
        footerView.snp.makeConstraints {
            $0.top.equalTo(footerCollectionView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(-16)
            $0.bottom.equalToSuperview()
        }
        
        footerLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
    }
    
}

extension HomeFooterView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return footerDummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = HomeFooterCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
        cell.configureCell(footerDummy[indexPath.item])
        if cell.imageView.image == nil {
            cell.imageView.isHidden = true
            cell.titleLabel.snp.remakeConstraints {
                $0.top.equalToSuperview().offset(23)
                $0.centerX.equalToSuperview()
            }
        }
        return cell
    }
}
