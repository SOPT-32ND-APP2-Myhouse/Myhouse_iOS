//
//  BestCollectionViewCell.swift
//  Myhouse
//
//  Created by Minjoo Kim on 2023/05/15.
//

import UIKit

import SnapKit

final class BestCollectionViewCell: UICollectionViewCell {
    
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
    
    lazy var scrapButton = ScrapButton()

    private let rankingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .NotoBold(size: 12)
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
        contentView.addSubviews(bestImageView,
                                descriptionLabel,
                                rankingLabel,
                                scrapButton)
        
        bestImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(60)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(bestImageView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
        }
        
        rankingLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.size.equalTo(20)
        }
        
        scrapButton.snp.makeConstraints {
            $0.bottom.trailing.equalTo(bestImageView).inset(4)
            $0.size.equalTo(24)
        }
    }
    
    func configureCell(_ bestData: PopularResponseModel) {
        bestImageView.kf.setImage(with: URL(string: bestData.image))
        descriptionLabel.text = bestData.title
        descriptionLabel.text = "\(bestData.subtitle)" + "\(descriptionLabel.text!) " 
        rankingLabel.text = "\(bestData.rate)"
        
        let fullText = descriptionLabel.text ?? ""
        let attribtuedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: "\(bestData.subtitle)")
        attribtuedString.addAttribute(.foregroundColor, value: UIColor.main, range: range)
        descriptionLabel.attributedText = attribtuedString
    }
}

extension BestCollectionViewCell: UICollectionViewRegisterable {
    
}
