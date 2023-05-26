//
//  DetailTableHeadView.swift
//  Myhouse
//
//  Created by 홍준혁 on 2023/05/22.
//

import UIKit

import SnapKit

final class DetailTableHeadView: BaseView {
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.User.userIcon
        return imageView
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .NotoBold(size: 14)
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .NotoMedium(size: 12)
        return label
    }()
    
    let followButton: UIButton = {
        let button = UIButton()
        button.setTitle("팔로우", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .main
        button.layer.cornerRadius = 4
        return button
    }()
    
    let grayLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let contentsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    override func setUI() {
        self.backgroundColor = .white
        self.addSubview(contentsView)
        contentsView.addSubviews(
            profileImage,
            userNameLabel,
            dateLabel,
            followButton,
            grayLineView
        )
    }
    
    override func setLayout() {
        contentsView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.height.width.equalTo(36)
            $0.leading.equalToSuperview().offset(14)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.top)
            $0.leading.equalTo(profileImage.snp.trailing).offset(12)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(3)
            $0.leading.equalTo(profileImage.snp.trailing).offset(12)
        }
        
        followButton.snp.makeConstraints {
            $0.height.equalTo(32)
            $0.width.equalTo(80)
            $0.top.equalTo(profileImage.snp.top).offset(3)
            $0.trailing.equalToSuperview().inset(10)
        }
        
        grayLineView.snp.makeConstraints {
            $0.height.equalTo(8)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(profileImage.snp.bottom).offset(16)
        }
    }
}
