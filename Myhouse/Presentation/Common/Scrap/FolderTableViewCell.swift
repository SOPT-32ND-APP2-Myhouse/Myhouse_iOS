//
//  FolderTableViewCell.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/18.
//

import UIKit

import Kingfisher
import SnapKit

final class FolderTableViewCell: UITableViewCell, UITableViewRegisterable {

    // MARK: - Properties
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private lazy var folderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let folderTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .NotoMedium(size: 14)
        return label
    }()
    
    // MARK: - Life Cycles
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension FolderTableViewCell {
    private func setLayout() {
        contentView.addSubviews(folderImageView, folderTitleLabel)
    
        folderImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(40)
        }
        
        folderTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(folderImageView.snp.trailing).offset(10)
            $0.centerY.equalToSuperview()
        }
    }
    
    func configureCell(_ scrapData: ScrapFolder) {
        folderImageView.kf.setImage(with: URL(string: scrapData.scraps[scrapData.scraps.count - 1].imageURL ?? ""))
        folderTitleLabel.text = scrapData.folderTitle
    }
}
