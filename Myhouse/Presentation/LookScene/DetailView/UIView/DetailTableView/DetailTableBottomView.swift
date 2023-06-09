//
//  DetailTableBottomCommentView.swift
//  Myhouse
//
//  Created by 홍준혁 on 2023/05/22.
//

import UIKit

import SnapKit

final class DetailTableBottomView: BaseView {
    
    let lineView0: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.User.userIcon
        return imageView
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "haomme"
        label.font = .NotoBold(size: 14)
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "01-31"
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
    
    let photoCollectionView = PhotoCollectionView()
    
    let lineView1: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    let goodCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .NotoMedium(size: 12)
        return label
    }()
    
    let scrapCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .NotoMedium(size: 12)
        return label
    }()
    
    let commentCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .NotoMedium(size: 12)
        return label
    }()
    
    let watchedCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .NotoMedium(size: 12)
        return label
    }()
    
    let lineView2: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    let commentDetailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .NotoMedium(size: 10)
        return label
    }()
    
    let commentUserProfileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.User.userIcon
        return imageView
    }()
    
    let commentUserNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "구구짠"
        label.font = .NotoMedium(size: 14)
        return label
    }()
    
    let commentLabel: UILabel = {
        let label = UILabel()
        label.text = "와 너무 이뻐요"
        label.textColor = .darkGray
        label.font = .NotoRegular(size: 12)
        return label
    }()
    
    let commentDetailDate: UILabel = {
        let label = UILabel()
        label.text = "5일"
        label.textColor = .darkGray
        label.font = .NotoMedium(size: 10)
        return label
    }()
    
    let commentDetailGood: UILabel = {
        let label = UILabel()
        label.text = "좋아요"
        label.textColor = .darkGray
        label.font = .NotoMedium(size: 10)
        return label
    }()
    
    let commentDetailAddComment: UILabel = {
        let label = UILabel()
        label.text = "답글달기"
        label.textColor = .darkGray
        label.font = .NotoMedium(size: 10)
        return label
    }()
    
    let commentDetailReport: UILabel = {
        let label = UILabel()
        label.text = "신고"
        label.textColor = .darkGray
        label.font = .NotoMedium(size: 10)
        return label
    }()
    
    let seeAllCommentLabel: UILabel = {
        let label = UILabel()
        label.text = "7개의 댓글 전체보기 >"
        label.textColor = .black
        label.font = .NotoMedium(size: 14)
        return label
    }()
    
    let seeAllCommentButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        return button
    }()
    
    let lineView3: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    let writeCommentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        view.backgroundColor = .white
        return view
    }()
    
    let writeCommentLabel: UILabel = {
        let label = UILabel()
        label.text = "댓글을 입력해주세요."
        label.textColor = .gray
        label.font = .NotoRegular(size: 14)
        return label
    }()
    
    let writeCommentAddButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("등록", for: .normal)
        button.setTitleColor(.main, for: .normal)
        button.titleLabel?.font = .NotoBold(size: 12)
        return button
    }()
    
    let lineView4: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    let recommendLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘의 추천 상품"
        label.textColor = .black
        label.font = .NotoBold(size: 16)
        return label
    }()
    
    let recommendCollectionView = TodayRecommendCollectionView()
    
    let lineView5: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    let similarToUserLabel: UILabel = {
        let label = UILabel()
        label.text = "유저들의 비슷한 공간 베스트"
        label.textColor = .darkGray
        label.font = .NotoBold(size: 16)
        return label
    }()
    
    let similarBestView = SimilarBestCollectionView()
    
    let contentsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    override func setUI() {
        self.addSubview(contentsView)
        contentsView.addSubviews(
            lineView0,
            profileImage,
            userNameLabel,
            dateLabel,
            followButton,
            photoCollectionView,
            lineView1,
            goodCountLabel,
            scrapCountLabel,
            commentCountLabel,
            watchedCountLabel,
            lineView2,
            commentDetailLabel,
            commentUserProfileImage,
            commentUserNameLabel,
            commentLabel,
            commentDetailDate,
            commentDetailGood,
            commentDetailAddComment,
            commentDetailReport,
            seeAllCommentLabel,
            seeAllCommentButton,
            lineView3,
            writeCommentView,
            writeCommentLabel,
            writeCommentAddButton,
            lineView4,
            recommendLabel,
            recommendCollectionView,
            lineView5,
            similarToUserLabel,
            similarBestView
        )
    }
    
    override func setLayout() {
        lineView0.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(390)
            $0.height.equalTo(1)
        }
        
        profileImage.snp.makeConstraints {
            $0.top.equalTo(lineView0.snp.bottom).offset(27)
            $0.leading.equalToSuperview().offset(14)
            $0.height.width.equalTo(36)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(lineView0.snp.bottom).offset(28)
            $0.leading.equalTo(profileImage.snp.trailing).offset(12)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(3)
            $0.leading.equalTo(profileImage.snp.trailing).offset(12)
        }
        
        followButton.snp.makeConstraints {
            $0.centerY.equalTo(profileImage)
            $0.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(32)
            $0.width.equalTo(80)
        }
        
        photoCollectionView.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(14)
            $0.leading.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.height.equalTo(160)
        }
        
        lineView1.snp.makeConstraints {
            $0.top.equalTo(photoCollectionView.snp.bottom).offset(14)
            $0.leading.equalToSuperview()
            $0.width.equalTo(390)
            $0.height.equalTo(1)
        }
        
        goodCountLabel.snp.makeConstraints {
            $0.top.equalTo(lineView1.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(15)
        }
        
        scrapCountLabel.snp.makeConstraints {
            $0.top.equalTo(lineView1.snp.bottom).offset(20)
            $0.leading.equalTo(goodCountLabel.snp.trailing).offset(11)
        }
        
        commentCountLabel.snp.makeConstraints {
            $0.top.equalTo(lineView1.snp.bottom).offset(20)
            $0.leading.equalTo(scrapCountLabel.snp.trailing).offset(11)
        }
        
        watchedCountLabel.snp.makeConstraints {
            $0.top.equalTo(lineView1.snp.bottom).offset(20)
            $0.leading.equalTo(commentCountLabel.snp.trailing).offset(11)
        }
        
        lineView2.snp.makeConstraints {
            $0.top.equalTo(goodCountLabel.snp.bottom).offset(24)
            $0.leading.equalToSuperview()
            $0.width.equalTo(390)
            $0.height.equalTo(1)
        }
        
        commentDetailLabel.snp.makeConstraints {
            $0.top.equalTo(lineView2.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(15)
        }
        
        commentUserProfileImage.snp.makeConstraints {
            $0.top.equalTo(commentDetailLabel.snp.bottom).offset(22)
            $0.leading.equalToSuperview().offset(15)
            $0.height.width.equalTo(30)
        }
        
        commentUserNameLabel.snp.makeConstraints {
            $0.top.equalTo(commentDetailLabel.snp.bottom).offset(22)
            $0.leading.equalTo(commentUserProfileImage.snp.trailing).offset(10)
        }
        
        commentLabel.snp.makeConstraints {
            $0.top.equalTo(commentUserNameLabel.snp.bottom).offset(5)
            $0.leading.equalTo(commentUserProfileImage.snp.trailing).offset(10)
        }
        
        commentDetailDate.snp.makeConstraints {
            $0.top.equalTo(commentLabel.snp.bottom).offset(5)
            $0.leading.equalTo(commentUserProfileImage.snp.trailing).offset(10)
        }
        
        commentDetailGood.snp.makeConstraints {
            $0.top.equalTo(commentLabel.snp.bottom).offset(5)
            $0.leading.equalTo(commentDetailDate.snp.trailing).offset(10)
        }
        
        commentDetailAddComment.snp.makeConstraints {
            $0.top.equalTo(commentLabel.snp.bottom).offset(5)
            $0.leading.equalTo(commentDetailGood.snp.trailing).offset(10)
        }
        
        commentDetailReport.snp.makeConstraints {
            $0.top.equalTo(commentLabel.snp.bottom).offset(5)
            $0.leading.equalTo(commentDetailAddComment.snp.trailing).offset(10)
        }
        
        seeAllCommentLabel.snp.makeConstraints {
            $0.top.equalTo(commentDetailReport.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(131)
        }

        lineView3.snp.makeConstraints {
            $0.top.equalTo(seeAllCommentLabel.snp.bottom).offset(25)
            $0.leading.equalToSuperview()
            $0.width.equalTo(390)
            $0.height.equalTo(1)
        }
        
        writeCommentView.snp.makeConstraints {
            $0.top.equalTo(lineView3.snp.bottom).offset(15)
            $0.width.equalTo(360)
            $0.leading.equalToSuperview().offset(15)
            $0.height.equalTo(43)
        }
        
        writeCommentLabel.snp.makeConstraints {
            $0.top.equalTo(lineView3.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(21)
        }
        
        writeCommentAddButton.snp.makeConstraints {
            $0.top.equalTo(lineView3.snp.bottom).offset(28)
            $0.trailing.equalToSuperview().inset(50)
            $0.width.equalTo(23)
            $0.height.equalTo(17)
        }
        
        lineView4.snp.makeConstraints {
            $0.top.equalTo(writeCommentView.snp.bottom).offset(18)
            $0.leading.equalToSuperview()
            $0.width.equalTo(390)
            $0.height.equalTo(1)
        }
        
        recommendLabel.snp.makeConstraints {
            $0.top.equalTo(lineView4.snp.bottom).offset(14)
            $0.leading.equalToSuperview().offset(15)
        }
        
        recommendCollectionView.snp.makeConstraints {
            $0.top.equalTo(recommendLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.height.equalTo(260)
        }
        
        lineView5.snp.makeConstraints {
            $0.top.equalTo(recommendCollectionView.snp.bottom).offset(32)
            $0.leading.equalToSuperview()
            $0.width.equalTo(390)
            $0.height.equalTo(1)
        }
        
        similarToUserLabel.snp.makeConstraints {
            $0.top.equalTo(lineView5.snp.bottom).offset(26)
            $0.leading.equalToSuperview().offset(15)
        }
        
        similarBestView.snp.makeConstraints {
            $0.top.equalTo(similarToUserLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.height.equalTo(770)
        }
    }
}
