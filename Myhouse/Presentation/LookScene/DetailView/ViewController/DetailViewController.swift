//
//  DetailViewController.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/15.
//

import UIKit

import SnapKit
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
        setNavigationUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getAllDetail()
        showToast(message: "‘인테리어 꿀팁 모음'폴더로 이동했습니다")
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
    
    private func showToast(message : String, font: UIFont = UIFont.systemFont(ofSize: 12.0)) {
        let toastLabel = UILabel(frame: CGRect(x: 25, y: self.view.frame.size.height-50, width: 346, height: 39))
        toastLabel.backgroundColor = UIColor.black
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .left
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 4
        toastLabel.clipsToBounds  =  true
        
        let button = UIButton(frame: CGRect(x: 250, y: self.view.frame.size.height-40, width: 100, height: 17))
        button.setTitle("스크랩북 보기", for: .normal)
        button.setTitleColor(UIColor.main, for: .normal)
        
        self.view.addSubviews(
            toastLabel,
            button
        )
        
        UIView.animate(withDuration: 10.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
            button.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
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
