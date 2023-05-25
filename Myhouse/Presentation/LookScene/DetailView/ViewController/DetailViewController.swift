//
//  DetailViewController.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/15.
//

import UIKit

import Kingfisher

final class DetailViewController: BaseViewController {
    
    let tableView = DetailTableView()
    let detailTableFristSectionView = DetailTableFirstSectionView()
    let detailTableSecondSectionView = DetailTableSecondSectionView()
    private var serverData: GetDetailPostResponse? {
        didSet {
            tableView.reloadData()
            setData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getAllDetail()
    }
    
    override func setLayout() {
        view = tableView
    }
    
    private func setDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setData() {
        tableView.headerView.userNameLabel.text = serverData?.user_name
        tableView.headerView.dateLabel.text = serverData?.created_date
        tableView.footerView.goodCountLabel.text = "좋아요 \(String(describing: serverData!.like_count))"
        tableView.footerView.scrapCountLabel.text = "스크랩 \(String(describing: serverData!.scrap_count))"
        tableView.footerView.commentCountLabel.text = "댓글 \(String(describing: serverData!.comment_count))"
        tableView.footerView.watchedCountLabel.text = "조회수 \(String(describing: serverData!.view_count))"
        detailTableFristSectionView.introSizeTextLabel.text = serverData?.option_tag
        detailTableSecondSectionView.introSizeTextLabel.text = serverData?.images[0].content
    }
}

extension DetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return serverData?.images.count ?? Int()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as? DetailTableViewCell ?? DetailTableViewCell()
        let index = indexPath.row
        guard let url = URL(string: serverData?.images[index].image_url ?? String()) else { return cell }
        cell.imgView.kf.setImage(with: url)
        cell.imgId = serverData?.images[index].image_id ?? Int()
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
            return detailTableFristSectionView
        } else if section == 1 {
            return detailTableSecondSectionView
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
}

private extension DetailViewController {
    func getAllDetail() {
        ScrapService.shared.getAllDetailAPI { [weak self] networkResult in
            switch networkResult {
            case .success(let data):
                if let data = data as? GenericResponse<GetDetailPostResponse> {
                    if let allPostData = data.data {
                        self?.serverData = allPostData
                    }
                }
            default:
                break
            }
        }
    }
}
