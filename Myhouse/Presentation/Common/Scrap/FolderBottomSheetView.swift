//
//  ScrapBottomSheet.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/18.
//

import UIKit

import SnapKit

protocol FolderDelegate: AnyObject {
    func cancelTapped()
}

final class FolderBottomSheetView: BaseView {
    
    // MARK: - Properties
    
    weak var delegate: FolderDelegate?
    
    private var allFolderData: AllScrapResponseModel = AllScrapResponseModel(scrapFolders: [ScrapFolder]()) {
        didSet {
            self.folderTableView.reloadData()
        }
    }
    
    // MARK: - UI Components
    
    private let bottomSheetView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.roundCorners(cornerRadius: 11,
                          maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "폴더 선택"
        label.textAlignment = .center
        label.textColor = .black
        label.font = .NotoBold(size: 18)
        return label
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.Common.btn_delete, for: .normal)
        button.addTarget(self,
                         action: #selector(cancelButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    private let folderTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = 54
        tableView.sectionHeaderHeight = 54
        return tableView
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        fetchData()
        registerCell()
        setDelegate()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    override func setLayout() {
        self.addSubviews(bottomSheetView)
        bottomSheetView.addSubviews(titleLabel, cancelButton, folderTableView)
        
        bottomSheetView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(0)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenHeight / 2)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.centerX.equalToSuperview()
        }
        
        cancelButton.snp.makeConstraints {
            $0.size.equalTo(16)
            $0.top.trailing.equalToSuperview().inset(18)
        }
        
        folderTableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

// MARK: - Extensions

private extension FolderBottomSheetView {
    
    func fetchData() {
        getAllScrap()
    }
    
    func registerCell() {
        FolderTableViewCell.register(target: folderTableView)
        FolderHeaderView.register(target: folderTableView)
    }
    
    func setDelegate() {
        folderTableView.delegate = self
        folderTableView.dataSource = self
    }
    
    @objc func cancelButtonTapped() {
        delegate?.cancelTapped()
    }
}

extension FolderBottomSheetView: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension FolderBottomSheetView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allFolderData.scrapFolders.count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FolderTableViewCell.dequeueReusableCell(tableView: tableView, indexPath: indexPath)
        cell.configureCell(allFolderData.scrapFolders[indexPath.item + 1])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let newFolderView = FolderHeaderView.dequeueReusableHeaderFooterView(tableView: tableView)
        return newFolderView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("'\(allFolderData.scrapFolders[indexPath.row + 1].folderTitle)' 폴더로 이동했습니다")
    }
}

extension FolderBottomSheetView {
    func getAllScrap() {
        ScrapService.shared.getAllScrapAPI { networkResult in
            switch networkResult {
            case .success(let data):
                if let data = data as? GenericResponse<AllScrapResponseModel> {
                    if let allFolderData = data.data {
                        dump(allFolderData)
                        self.allFolderData = allFolderData
                    }
                }
            default:
                break
            }
        }
    }
}
