//
//  TodaysDealCollectionViewCell.swift
//  Myhouse
//
//  Created by Kim Min Joo on 2023/05/21.
//

import UIKit

import SnapKit

final class TodaysDealCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Home.img_home11
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let oneDayLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.layer.maskedCorners = [.layerMaxXMinYCorner]
        label.layer.masksToBounds = true
        label.text = "1DAY SALE"
        label.font = .NotoBold(size: 14)
        label.textColor = .white
        label.backgroundColor = .sale
        return label
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "01:31:17 남음"
        label.font = .NotoMedium(size: 12)
        label.textColor = .white
        label.backgroundColor = .point
        label.textAlignment = .center
        label.layer.cornerRadius = 4
        label.layer.masksToBounds = true
        
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "[오믈의 딜] 23년신상! 보랄 무선 선풍기 미니"
        label.font = .NotoMedium(size: 12)
        label.textColor = .black
        return label
    }()
    
    private let saleLabel: UILabel = {
        let label = UILabel()
        label.text = "84"
        label.font = .NotoMedium(size: 52)
        label.textColor = .point
        return label
    }()
    
    private let percentLabel: UILabel = {
        let label = UILabel()
        label.text = "%"
        label.font = .NotoBold(size: 16)
        label.textColor = .point
        label.sizeToFit()
        return label
    }()
    
    private let moreLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.text = "특가 832개 더보기 >"
        label.font = .NotoBold(size: 12)
        label.textColor = .point
        label.sizeToFit()
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

extension TodaysDealCollectionViewCell {

    private func setLayout() {
        contentView.addSubviews(imageView,
                                oneDayLabel,
                                timerLabel,
                                titleLabel,
                                saleLabel,
                                percentLabel,
                                moreLabel)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        oneDayLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.top)
            $0.trailing.equalTo(imageView.snp.trailing)
            $0.size.equalTo(50)
        }
        
        timerLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(imageView.snp.trailing).offset(10)
            $0.width.equalTo(88)
            $0.height.equalTo(21)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(timerLabel.snp.bottom).offset(10)
            $0.leading.equalTo(imageView.snp.trailing).offset(10)
            $0.width.equalTo(UIScreen.main.bounds.size.width * 0.4)
        }
        
        saleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalTo(imageView.snp.trailing).offset(10)
        }
        
        percentLabel.snp.makeConstraints {
            $0.bottom.equalTo(saleLabel.snp.bottom).inset(8)
            $0.leading.equalTo(saleLabel.snp.trailing)
        }
        
        moreLabel.snp.makeConstraints {
            $0.top.equalTo(saleLabel.snp.bottom).offset(0)
            $0.leading.equalTo(imageView.snp.trailing).offset(10)
        }
    }
}
