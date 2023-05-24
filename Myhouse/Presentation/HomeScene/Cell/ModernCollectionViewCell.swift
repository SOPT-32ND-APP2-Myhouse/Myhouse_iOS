//
//  ModernCollectionViewCell.swift
//  Myhouse
//
//  Created by Kim Min Joo on 2023/05/16.
//

import UIKit

import SnapKit

final class ModernCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let bestImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .NotoMedium(size: 12)
        label.textColor = .black
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
}

// MARK: - Extensions

extension ModernCollectionViewCell {

    private func setLayout() {
        contentView.addSubviews(bestImageView,
                                descriptionLabel)
        
        bestImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(bestImageView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func configureCell(_ modernData: ModernDataModel) {
        bestImageView.image = modernData.image
        descriptionLabel.text = modernData.title
        descriptionLabel.text = (descriptionLabel.text ?? "") + " \(modernData.description)"
        
        let fullText = descriptionLabel.text ?? ""
        let attribtuedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: "\(modernData.title)")
        attribtuedString.addAttribute(.foregroundColor, value: UIColor.main, range: range)
        descriptionLabel.attributedText = attribtuedString
    }
}
