//
//  CollectionReusableView.swift
//  Myhouse
//
//  Created by Minjoo Kim on 2023/05/15.
//

import UIKit

import SnapKit

class SectionTitleCollectionReusableView: UICollectionReusableView, UICollectionHeaderViewRegisterable {
    
    // MARK: - Properties

    static var isFromNib: Bool = false

    // MARK: - UI Components

    let sectionTitleLabel = UILabel()
    
    let sectionDescription: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .NotoRegular(size: 14)
        label.isHidden = true
        return label
    }()
    
    let ADImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Common.icn_ad
        imageView.isHidden = true
        return imageView
    }()
    
    let moreLabel: UILabel = {
        let label = UILabel()
        label.text = "더보기"
        label.textColor = .main
        label.font = .NotoMedium(size: 14)
        label.isHidden = true
        return label
    }()
    
    // MARK: - Life Cycles

    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        sectionTitleLabel.text = nil
        sectionDescription.text = nil
        self.ADImageView.isHidden = true
        self.moreLabel.isHidden = true
        self.moreLabel.text = "더보기"
    }
}

// MARK: - Extensions

extension SectionTitleCollectionReusableView {

    private func setLayout() {
        self.addSubviews(sectionTitleLabel, sectionDescription, ADImageView, moreLabel)

        sectionTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        sectionDescription.snp.makeConstraints {
            $0.top.equalTo(sectionTitleLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        ADImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        moreLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }

    func setSectionTitle(text: String?) {
        self.sectionTitleLabel.text = text
        self.sectionTitleLabel.textColor = .black
        self.sectionTitleLabel.font = .NotoBold(size: 14)
    }
    
    func setSectionDescription(text: String?) {
        self.sectionDescription.text = text
        self.sectionDescription.isHidden = false
    }
    
    func setRecommendSectionTitle(_ recommendData: RecommendResponseModel) {
        self.sectionTitleLabel.text = "\(recommendData.post.userName)님을 위한 \(recommendData.post.tag)"
        self.sectionTitleLabel.textColor = .black
        self.sectionTitleLabel.font = .NotoBold(size: 14)
    }
}
