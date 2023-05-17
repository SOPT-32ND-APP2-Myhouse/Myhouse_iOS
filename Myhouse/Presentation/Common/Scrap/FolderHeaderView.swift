//
//  FolderHeaderView.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/18.
//

import UIKit

import SnapKit

final class FolderHeaderView: UITableViewHeaderFooterView, UITableViewHeaderFooterRegisterable {
    
    // MARK: - Properties
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private lazy var newFolderButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.Common.btn_plus, for: .normal)
        button.backgroundColor = .main
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        return button
    }()
    
    private let folderTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "새로운 폴더 추가하기"
        label.textColor = .black
        label.font = .NotoMedium(size: 14)
        return label
    }()
    
    // MARK: - Life Cycles
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension FolderHeaderView {
    private func setLayout() {
        contentView.addSubviews(newFolderButton,folderTitleLabel)
        
        newFolderButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(40)
        }
        
        folderTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(newFolderButton.snp.trailing).offset(10)
            $0.centerY.equalToSuperview()
        }
    }
}
