//
//  ScarpView.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/15.
//

import UIKit

import SnapKit

final class ScarpView: BaseView {
    
    // MARK: - Properties
    
    private var ScarpDummy = ScrapDataModel.dummy()
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "스크랩북"
        label.textColor = .black
        label.font = .NotoBold(size: 18)
        return label
    }()
    
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Card.img_card02
        imageView.layer.cornerRadius = 7
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let userNicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nickname"
        label.textColor = .darkGray
        label.font = .NotoMedium(size: 12)
        return label
    }()
    
    private let userStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .center
        return stackView
    }()
    
    private let editButton: UIButton = {
        let button = UIButton()
        button.setTitle("편집", for: .normal)
        button.setTitleColor(.main, for: .normal)
        button.titleLabel?.font = .NotoMedium(size: 14)
        button.backgroundColor = .white
        return button
    }()
    
    private let scarpCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (SizeLiterals.Screen.screenWidth - 30) / 2, height: (SizeLiterals.Screen.screenWidth - 30) / 2 + 35)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 8

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - Life Cycles
      
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setDelegate()
        registerCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    override func setLayout() {
        self.addSubviews(titleLabel,
                         userImageView,
                         userNicknameLabel,
                         userStackView,
                         editButton,
                         scarpCollectionView)
        userStackView.addArrangedSubviews(userImageView, userNicknameLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.centerX.equalToSuperview()
        }
        
        userImageView.snp.makeConstraints {
            $0.size.equalTo(14)
        }
        
        userNicknameLabel.snp.makeConstraints {
            $0.height.equalTo(14)
        }

        userStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(13)
            $0.centerX.equalToSuperview()
        }
        
        editButton.snp.makeConstraints {
            $0.top.equalTo(userStackView.snp.bottom)
            $0.trailing.equalToSuperview().inset(14)
            $0.width.equalTo(26)
            $0.height.equalTo(15)
        }
        
        scarpCollectionView.snp.makeConstraints {
            $0.top.equalTo(editButton.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

// MARK: - Extensions

private extension ScarpView {
    func setDelegate() {
        scarpCollectionView.delegate = self
        scarpCollectionView.dataSource = self
    }
    
    func registerCell() {
        ScrapCollectionViewCell.register(target: scarpCollectionView)
    }
}

extension ScarpView: UICollectionViewDelegate {
    
}

extension ScarpView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ScarpDummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = ScrapCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
        cell.configureCell(ScarpDummy[indexPath.item])
        return cell
    }
}
