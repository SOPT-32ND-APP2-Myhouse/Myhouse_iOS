//
//  ModernCollectionViewCell.swift
//  Myhouse
//
//  Created by Kim Min Joo on 2023/05/16.
//

import UIKit

import SnapKit

class ModernCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let bestImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        return imageView
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .NotoMedium(size: 13)
        label.textColor = .black
        return label
    }()
    public let bookmarkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Common.icn_scrapbook.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .white
        
        return imageView
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

extension ModernCollectionViewCell {

    
    private func setLayout() {
        contentView.addSubviews(bestImageView, descriptionLabel, bookmarkImageView)
        
        bestImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(112)
            $0.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(bestImageView.snp.bottom).inset(-12)
            $0.width.equalTo(bestImageView.snp.width)
            $0.height.equalTo(44)
            $0.centerX.equalToSuperview()
        }

        bookmarkImageView.snp.makeConstraints {
            $0.bottom.trailing.equalTo(bestImageView).inset(10)
            $0.width.equalTo(15)
            $0.height.equalTo(16)
        }
    }
    
    func configureCell(_ modernData: modernDataModel) {
        bestImageView.image = modernData.image
        descriptionLabel.text = modernData.title
        descriptionLabel.text = (descriptionLabel.text ?? "") + " \(modernData.description)"
        
        // 특정 글씨만 main colour로 변경
        let fullText = descriptionLabel.text ?? ""
        let attribtuedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: "\(modernData.title)")
        attribtuedString.addAttribute(.foregroundColor, value: UIColor.main, range: range)
        descriptionLabel.attributedText = attribtuedString
    }

}
