//
//  DetailTableView.swift
//  Myhouse
//
//  Created by 홍준혁 on 2023/05/22.
//

import UIKit

import SnapKit

final class DetailTableView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupTableView() {
        register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
        self.rowHeight = 486
        showsVerticalScrollIndicator = true
        
        let screenWidth = UIScreen.main.bounds.width
        
        let headerView = DetailTableHeadView()
        headerView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 84)
        self.tableHeaderView = headerView

        let footerView = DetailTableBottomView()
        footerView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 1498)
        self.tableFooterView = footerView
    }
}

