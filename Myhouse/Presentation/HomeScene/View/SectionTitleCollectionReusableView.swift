//
//  CollectionReusableView.swift
//  Myhouse
//
//  Created by Minjoo Kim on 2023/05/15.
//

import UIKit

import SnapKit

class SectionTitleCollectionReusableView: UICollectionReusableView, UICollectionHeaderViewRegisterable {
    
    // MARK: - Properties

    static var isFromNib: Bool = false

    // MARK: - UI Components

    let sectionTitleLabel = UILabel()
    
    let sectionDescription: UILabel? = {
        let label = UILabel()
        label.textColor = .black
        label.font = .NotoRegular(size: 14)
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        sectionTitleLabel.text = nil
        sectionDescription?.text = nil
    }
}

// MARK: - Extensions

extension SectionTitleCollectionReusableView {

    private func setLayout() {
        self.addSubviews(sectionTitleLabel, sectionDescription!)

        sectionTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        sectionDescription?.snp.makeConstraints {
            $0.top.equalTo(sectionTitleLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
    }

    func setSectionTitle(text: String?) {
        self.sectionTitleLabel.text = text
        self.sectionTitleLabel.textColor = .black
        self.sectionTitleLabel.font = .NotoBold(size: 16)
    }
    func setSectionDescription(text: String?) {
        self.sectionDescription?.text = text
    }
}
