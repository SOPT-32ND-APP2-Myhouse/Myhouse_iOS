//
//  HomeViewController.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/15.
//

import UIKit

class HomeViewController: BaseViewController {
    // MARK: - UI Components
        
        private let homeView = HomeView()
        
        // MARK: - Life Cycles
        
        override func loadView() {
            self.view = homeView
        }
        
        override func setUI() {
            self.navigationController?.navigationBar.isHidden = true
        }
    }
