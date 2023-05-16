//
//  ColorBestCollectionVIewCell.swift
//  Myhouse
//
//  Created by Minjoo Kim on 2023/05/16.
//

import UIKit

import SnapKit

class ColorBestCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
   
   
   static var isFromNib: Bool = false
   
   // MARK: - UI Components
   
   private let colorBestImageView: UIImageView = {
       let imageView = UIImageView()
       imageView.layer.cornerRadius = 4
       return imageView
   }()
   
   private let descriptionLabel: UILabel = {
       let label = UILabel()
       label.numberOfLines = 0
       label.font = .NotoMedium(size: 13)
       label.textColor = .black
       label.sizeToFit()
       return label
   }()
   
   private let bookmarkButton = BestCollectionViewCell().bookmarkButton
   
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

extension ColorBestCollectionViewCell {

   private func setLayout() {
       contentView.addSubviews(colorBestImageView, descriptionLabel, bookmarkButton)
       
       colorBestImageView.snp.makeConstraints {
           $0.top.leading.equalToSuperview()
           $0.width.equalToSuperview()
           $0.height.equalTo(self.colorBestImageView.snp.width)
           $0.centerX.equalToSuperview()
       }
       
       descriptionLabel.snp.makeConstraints {
           $0.top.equalTo(colorBestImageView.snp.bottom).inset(-12)
           $0.width.equalTo(colorBestImageView.snp.width)
           $0.centerX.equalToSuperview()
       }
       bookmarkButton.snp.makeConstraints {
           $0.bottom.trailing.equalTo(colorBestImageView).inset(8)
           $0.width.equalTo(24)
           $0.height.equalTo(24)
       }
   }
   
   func configureCell(_ recommendData: colorBestDataModel) {
       recommendImageView.image = recommendData.image
       descriptionLabel.text = recommendData.highlight
       descriptionLabel.text = (descriptionLabel.text ?? "") + "\(recommendData.title)"
       
       let fullText = descriptionLabel.text ?? ""
       let attribtuedString = NSMutableAttributedString(string: fullText)
       guard let highlightText = recommendData.highlight else { return }
       if !highlightText.isEmpty {
           let range = (fullText as NSString).range(of: "\(highlightText)")
           attribtuedString.addAttribute(.foregroundColor, value: UIColor.main, range: range)
           descriptionLabel.attributedText = attribtuedString
       }
       
   }

}
