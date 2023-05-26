//
//  DetailViewController.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/15.
//

import UIKit

final class DetailViewController: BaseViewController {
    
    let tableView = DetailTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setNavigationUI()
    }
    
    override func setLayout() {
        view = tableView
    }
    
    private func setDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension DetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as? DetailTableViewCell ?? DetailTableViewCell()
        cell.selectionStyle = .none
        return cell
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 486
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return DetailTableFirstSectionView()
        } else if section == 1 {
            return DetailTableSecondSectionView()
        } else {
            return nil
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 45
        } else if section == 1 {
            return 60
        } else {
            return 0
        }
    }
    
    func setNavigationUI() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: ImageLiterals.Common.btn_back, style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: ImageLiterals.Common.btn_more, style: .plain, target: self, action: #selector(moreButtonTapped))
    }

    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: false)
    }

    @objc func moreButtonTapped() {
        print("More Button Tapped")
    }
}
