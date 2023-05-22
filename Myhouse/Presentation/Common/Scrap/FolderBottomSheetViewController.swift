//
//  ScrapBottomSheetViewController.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/18.
//

import UIKit

final class FolderBottomSheetViewController: BaseViewController {
  
    // MARK: - UI Components
    
    private let folderBottomSheetView = FolderBottomSheetView()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showBottomSheetWithAnimation()
    }
    
    override func setUI() {
        self.view.backgroundColor = .clear
    }
    
    override func setLayout() {
        self.view.addSubviews(folderBottomSheetView)
        folderBottomSheetView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(-(SizeLiterals.Screen.screenHeight / 2))
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenHeight / 2)
            
        }
    }
}

extension FolderBottomSheetViewController {
    
    private func setDelegate() {
        folderBottomSheetView.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let touch = touches.first,
           touch.view == self.view {
            view.backgroundColor = .none
            hideBottomSheetWithAnimation()
        }
    }
    
    func showBottomSheetWithAnimation() {
        folderBottomSheetView.snp.updateConstraints { $0.bottom.equalToSuperview() }
        UIView.animate(withDuration: 1.0) {
            self.view.backgroundColor = UIColor(white: 0, alpha: 0.4)
            self.view.layoutIfNeeded()
        }
    }
    
    func hideBottomSheetWithAnimation() {
        folderBottomSheetView.snp.updateConstraints { $0.bottom.equalToSuperview().inset(-(SizeLiterals.Screen.screenHeight / 2)) }
        UIView.animate(withDuration: 1.0) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.view.backgroundColor = .clear
            self.dismiss(animated: false)
        }
    }
}

extension FolderBottomSheetViewController: FolderDelegate {
    func cancelTapped() {
        hideBottomSheetWithAnimation()
    }
}
