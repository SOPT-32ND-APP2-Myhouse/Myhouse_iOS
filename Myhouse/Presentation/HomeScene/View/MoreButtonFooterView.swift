//
//  MoreButton.swift
//  Myhouse
//
//  Created by Kim Min Joo on 2023/05/16.
//

import UIKit

import SnapKit

final class MoreButtonFooterView: UICollectionReusableView, UICollectionFooterViewRegisterable {
    
    // MARK: - Properties
    
    static var isFromNib = false
    
    // MARK: - UI Components

    public let moreButton: UIButton = {
        let button = UIButton()
        button.setTitle("더보기 ", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .NotoBold(size: 12)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 4
        return button
    }()
    
    public let moreImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Home.img_more
        return imageView
    }()
    
    public let division: UIView = DivisionFooterView().division
    
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
        moreButton.setTitle("더보기 ", for: .normal)
    }
}

// MARK: - Extensions

private extension MoreButtonFooterView {

    func setLayout() {
        addSubviews(moreButton, division, moreImageView)
        
        moreButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        moreImageView.snp.makeConstraints {
            $0.leading.equalTo(moreButton.titleLabel!.snp.trailing)
            $0.centerY.equalTo(moreButton.snp.centerY)
        }
        
        division.snp.makeConstraints {
            $0.top.equalTo(moreButton.snp.bottom).inset(-18)
            $0.leading.trailing.equalToSuperview().inset(-16)
            $0.height.equalTo(8)

        }
    }
}
