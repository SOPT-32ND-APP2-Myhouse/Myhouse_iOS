//
//  RecommendCollectionViewCell.swift
//  Myhouse
//
//  Created by Minjoo Kim on 2023/05/15.
//

import UIKit

import SnapKit

final class RecommendCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let recommendImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    public let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .NotoMedium(size: 12)
        label.textColor = .black
        label.sizeToFit()
        return label
    }()
    
    private let bookmarkButton = BestCollectionViewCell().bookmarkButton
    
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

extension RecommendCollectionViewCell {

    private func setLayout() {
        contentView.addSubviews(recommendImageView,
                                descriptionLabel,
                                bookmarkButton)
        
        recommendImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(recommendImageView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
        }
        
        bookmarkButton.snp.makeConstraints {
            $0.bottom.trailing.equalTo(recommendImageView).inset(8)
            $0.size.equalTo(24)
        }
    }
    
    func configureCell(_ recommendData: RecommendDataModel) {
        recommendImageView.image = recommendData.image
        descriptionLabel.text = recommendData.highlight
        descriptionLabel.text = (descriptionLabel.text ?? "") + "\(recommendData.title)"
        
        let fullText = descriptionLabel.text ?? ""
        let attribtuedString = NSMutableAttributedString(string: fullText)
        guard let highlightText = recommendData.highlight else { return }
        if !highlightText.isEmpty {
            let range = (fullText as NSString).range(of: "\(highlightText)")
            attribtuedString.addAttribute(.foregroundColor, value: UIColor.main, range: range)
            descriptionLabel.attributedText = attribtuedString
        }
    }
}
