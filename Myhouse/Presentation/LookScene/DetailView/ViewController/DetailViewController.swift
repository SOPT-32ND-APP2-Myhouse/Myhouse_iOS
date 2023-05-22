//
//  DetailViewController.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/15.
//

import UIKit

final class DetailViewController: BaseViewController {
    
    let tableView = DetailTableView()
    
    override func setLayout() {
        view = tableView
    }
}
