//
//  ScrapButton.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/19.
//

import UIKit

final class ScrapButton: UIButton {
    
    var handler: (() -> (Void))?
    
    var isTapped: Bool = false {
        didSet {
            updateButton()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }}

extension ScrapButton {
    private func setUI() {
        self.setImage(ImageLiterals.Common.btn_bookMarkUnactived_small, for: .normal)
        self.addTarget(self, action: #selector(scrapButtonTapped), for: .touchUpInside)
    }
    
    func updateButton() {
        let image = isTapped ? ImageLiterals.Common.btn_bookMarkActived_small : ImageLiterals.Common.btn_bookMarkUnactived_small
        self.setImage(image, for: .normal)
    }

    @objc func scrapButtonTapped() {
        print("스크랩 스낵바 올라올 예정 ~ ")
        handler?()
    }
}
