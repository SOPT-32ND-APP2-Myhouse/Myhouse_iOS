//
//  LookViewController.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/15.
//

import UIKit

final class LookViewController: BaseViewController {
    
    var scrapButtonTapped: (() -> Void)?

    // MARK: - UI Components
    
    private let lookView = LookCollectionView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = lookView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrapTapped()
    }
}

// MARK: - Extensions

extension LookViewController {
    func scrapTapped() {
        lookView.scrapButtonTapped = {
            self.scrapButtonTapped?()
        }
    }
}
