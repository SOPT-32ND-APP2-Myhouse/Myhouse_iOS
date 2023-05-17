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
    
    override func loadView() {
        self.view = folderBottomSheetView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black // 삭제 예정
    }

}
