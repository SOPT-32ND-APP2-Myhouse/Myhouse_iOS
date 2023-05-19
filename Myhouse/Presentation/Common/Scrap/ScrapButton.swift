//
//  ScrapButton.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/19.
//

import UIKit

final class ScrapButton: UIButton {

    // MARK: - Life Cycles
    
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
        self.setImage(ImageLiterals.Common.btn_bookMarkActived_small, for: .selected)
        self.addTarget(self, action: #selector(scrapButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func scrapButtonTapped(_ sender: UIButton) {
        if !(sender.isSelected) {
            print("스크랩 스낵바 올라올 예정 ~ ")
        }
        sender.isSelected.toggle()
    }
}
