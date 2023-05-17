//
//  ScarpViewController.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/15.
//

import UIKit

final class ScarpViewController: BaseViewController {

    private let scrapView = ScarpView()
    
    override func loadView() {
        self.view = scrapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationUI()
    }
    
    func setNavigationUI() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: ImageLiterals.Common.btn_back, style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: ImageLiterals.Common.btn_share, style: .plain, target: self, action: #selector(shareButtonTapped))
    }

    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: false)
    }

    @objc func shareButtonTapped() {
        print("Share Button Tapped")
    }
}
