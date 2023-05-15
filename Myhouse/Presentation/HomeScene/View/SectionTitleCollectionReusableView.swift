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

    private let sectionTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .NotoBold(size: 15)
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

extension SectionTitleCollectionReusableView {

    private func setLayout() {
        self.addSubviews(sectionTitleLabel)

        sectionTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
        }
    }

    func setSectionTitle(text: String?) {
        self.sectionTitleLabel.text = text
    }
}

