//
//  DetailTableView.swift
//  Myhouse
//
//  Created by 홍준혁 on 2023/05/22.
//

import UIKit

import SnapKit

final class DetailTableView: UITableView {
    
    let headerView = DetailTableHeadView()
    let footerView = DetailTableBottomView()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .plain)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupTableView() {
        register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
        self.rowHeight = 486
        showsVerticalScrollIndicator = false
        
        let screenWidth = UIScreen.main.bounds.width
        headerView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 84)
        self.tableHeaderView = headerView
        footerView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 1600)
        self.tableFooterView = footerView
    }
}

