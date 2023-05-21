//
//  ScrapButton.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/19.
//

import UIKit

// MARK: - Protocols

protocol ScrapCVCDelegate: AnyObject {
    func scrapCVCButtonTapped()
}

final class ScrapButton: UIButton {
    
    // MARK: - Properties
    
    var handler: (() -> Void)?
    weak var delegate: ScrapCVCDelegate?
    
    var isTapped: Bool = false {
        didSet {
            updateButton()
        }
    }
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension ScrapButton {
    private func setUI() {
        self.setImage(ImageLiterals.Common.btn_bookMarkUnactived_small, for: .normal)
        self.addTarget(self, action: #selector(scrapButtonTapped), for: .touchUpInside)
    }
    
    func updateButton() {
        let image = isTapped ? ImageLiterals.Common.btn_bookMarkActived_small :                 ImageLiterals.Common.btn_bookMarkUnactived_small
        self.setImage(image, for: .normal)
    }
    
    @objc func scrapButtonTapped() {
        if !(isTapped) {
            delegate?.scrapCVCButtonTapped()
        }
        handler?()
    }
}
