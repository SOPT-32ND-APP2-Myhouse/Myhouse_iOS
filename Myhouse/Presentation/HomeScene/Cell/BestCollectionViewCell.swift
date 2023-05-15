//
//  CollectionViewCell.swift
//  Myhouse
//
//  Created by Minjoo Kim on 2023/05/15.
//

import UIKit

import SnapKit

class BestCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let bestImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemGray
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
    

    
    private let rankingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .NotoMedium(size: 12)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .main
        label.layer.cornerRadius = 5
        label.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        label.layer.masksToBounds = true
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

extension BestCollectionViewCell {

    
    private func setLayout() {
        contentView.addSubviews(bestImageView, descriptionLabel, rankingLabel)
        
        bestImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(150)
            $0.height.equalTo(150)
            $0.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(bestImageView.snp.bottom).inset(-12)
            $0.width.equalTo(bestImageView.snp.width)
            $0.height.equalTo(44)
            $0.centerX.equalToSuperview()
        }
        
        rankingLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }
    }
    
    func configureCell(_ bestData: HomeDataModel) {
        bestImageView.image = bestData.image
        descriptionLabel.text = bestData.title
        descriptionLabel.text = (descriptionLabel.text ?? "") + " \(bestData.description)"
        rankingLabel.text = "\(bestData.rank)"
        
        // 특정 글씨만 main colour로 변경
        let fullText = descriptionLabel.text ?? ""
        let attribtuedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: "\(bestData.title)")
        attribtuedString.addAttribute(.foregroundColor, value: UIColor.main, range: range)
        descriptionLabel.attributedText = attribtuedString
        }

}
