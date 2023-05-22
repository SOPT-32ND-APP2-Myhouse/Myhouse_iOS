//
//  ScrapPopUpView.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/20.
//

import UIKit

// MARK: - Protocols

protocol ScrapPopUpDelegate: AnyObject {
    func scrapBookButtonTapped()
    func folderButtonTapped()
}

final class ScrapPopUpView: BaseView {
    
    // MARK: - Properties
    weak var delegate: ScrapPopUpDelegate?
    
    // MARK: - UI Components
    
    private let ScrapLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Scrap.scarpDescription
        label.textColor = .black
        label.font = .NotoRegular(size: 14)
        return label
    }()
    
    private lazy var ScrapBookButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.Scrap.scrapButtonTitle, for: .normal)
        button.setTitleColor(.main, for: .normal)
        button.titleLabel?.font = .NotoBold(size: 14)
        button.backgroundColor = .white
        button.makeRoundBorder(cornerRadius: 4, borderWidth: 1, borderColor: .main)
        button.addTarget(self,
                         action: #selector(scrapBookButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var FolderButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.Scrap.folderButtonTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .NotoBold(size: 14)
        button.backgroundColor = .main
        button.makeRoundBorder(cornerRadius: 4, borderWidth: 1, borderColor: .main)
        button.addTarget(self,
                         action: #selector(folderButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        self.backgroundColor = .white
    }
    
    override func setLayout() {
        self.addSubviews(ScrapLabel,
                         ScrapBookButton,
                         FolderButton)
        
        ScrapLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(18)
        }
        
        ScrapBookButton.snp.makeConstraints {
            $0.centerY.equalTo(ScrapLabel.snp.centerY)
            $0.height.equalTo(40)
            $0.width.equalTo(106)
            $0.trailing.equalTo(FolderButton.snp.leading).offset(-6)
        }
        
        FolderButton.snp.makeConstraints {
            $0.centerY.equalTo(ScrapLabel.snp.centerY)
            $0.height.equalTo(40)
            $0.width.equalTo(93)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}

// MARK: - Extensions

private extension ScrapPopUpView {
    @objc func scrapBookButtonTapped() {
        delegate?.scrapBookButtonTapped()
    }
    
    @objc func folderButtonTapped() {
        delegate?.folderButtonTapped()
    }
}
