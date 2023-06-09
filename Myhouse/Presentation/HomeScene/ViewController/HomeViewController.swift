//
//  HomeViewController.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/15.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    private var allRecommendData: RecommendResponseModel = RecommendResponseModel(post: Post(tag: "", userName: "", postID: 0, imageURL: "", title: "")) {
        didSet {
            homeView.homeCollectionView.reloadData()
        }
    }
    
    private var allPopularData: [PopularResponseModel] = [] {
        didSet {
            homeView.homeCollectionView.reloadData()
        }
    }
    
    private var bestDummy = BestDataModel.dummy() {
        didSet {
            homeView.homeCollectionView.reloadData()
        }
    }
    
    private var recommendDummy = RecommendDataModel.dummy() {
        didSet {
            homeView.homeCollectionView.reloadData()
        }
    }
    
    private var todaysDummy = TodaysDataModel.dummy() {
        didSet {
            homeView.homeCollectionView.reloadData()
        }
    }
    
    private var summerDummy = RecommendDataModel.summer() {
        didSet {
            homeView.homeCollectionView.reloadData()
        }
    }
    
    private var colorDummy = ColorLightDataModel.dummy() {
        didSet {
            homeView.homeCollectionView.reloadData()
        }
    }
    
    private var top10Dummy = ColorLightDataModel.top10() {
        didSet {
            homeView.homeCollectionView.reloadData()
        }
    }
    
    private let topCategoryDummy = TopCategoryDataModel.dummy()
    private let modernDummy = ModernDataModel.dummy()
    private let categoryDummy = CategoryDataModel.dummy()
    private let colorBestDummy = TodaysDataModel.colorBest()
    private let reviewDumy = RecommendDataModel.review()
    private let ideasDummy = IdeaDataModel.dummy()
    
    typealias SectionType = AboutSection
    
    @frozen
    enum AboutSection: CaseIterable {
        case banner, topCategory, best, recommend, todays, modern, category, todaysDeal, summer, color, colorBest, top10, review, ideas, bestSeller
    }
    
    
    // MARK: - UI Components
    
    private let homeView = HomeView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRecommendAPI()
        getPopularAPI()
        setNavigationUI()
        setDataSource()
    }
    
    func setDataSource() {
        homeView.homeCollectionView.dataSource = self
    }
}

// MARK: - Extensions

extension HomeViewController {
    
    func setNavigationUI() {
        let scrapButton = UIButton()
        scrapButton.setImage(ImageLiterals.Common.icn_scrapbook.resize(newWidth: 18), for: .normal)
        scrapButton.addTarget(self, action: #selector(scrapNaviItemTapped), for: .touchUpInside)
        let cartButton = UIButton()
        cartButton.setImage(ImageLiterals.Common.icn_cart, for: .normal)

        let righthStackview = UIStackView.init(arrangedSubviews: [scrapButton, cartButton])
        righthStackview.distribution = .equalSpacing
        righthStackview.axis = .horizontal
        righthStackview.alignment = .center
        righthStackview.spacing = 12

        let rightStackBarButtonItem = UIBarButtonItem(customView: righthStackview)
        self.navigationItem.rightBarButtonItem = rightStackBarButtonItem
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: SizeLiterals.Screen.screenWidth * 275 / 375, height: 0))
        searchBar.placeholder = I18N.Home.searchPlaceholder
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: searchBar)
    }

    @objc func scrapNaviItemTapped() {
        let scrapViewController = ScarpViewController()
        self.navigationController?.pushViewController(scrapViewController, animated: false)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return AboutSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = SectionType.allCases[section]
        switch sectionType {
        case .banner:
            return 1
        case .topCategory:
            return topCategoryDummy.count
        case .best:
            return allPopularData.count
        case .recommend:
            return 4
        case .todays:
            return todaysDummy.count
        case .modern:
            return modernDummy.count
        case .category:
            return categoryDummy.count
        case .todaysDeal:
            return 1
        case .summer:
            return summerDummy.count
        case .color:
            return colorDummy.count
        case .colorBest:
            return colorBestDummy.count
        case .top10:
            return top10Dummy.count
        case .review:
            return reviewDumy.count
        case .ideas:
            return ideasDummy.count
        case .bestSeller:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = SectionType.allCases[indexPath.section]
        switch sectionType {
        case .banner:
            let cell = BannerCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            return cell
        case .topCategory:
            let cell = TopCategoryCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(topCategoryDummy[indexPath.item])
            return cell
        case .best:
            let cell = BestCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(allPopularData[indexPath.item])
            return cell
        case .recommend:
            let cell = RecommendCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureServerCell(allRecommendData)
            return cell
        case .todays:
            let cell = TodaysProductCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(todaysDummy[indexPath.item])
            cell.scrapButton.handler = { [weak self] in
                guard let self else { return }
                self.todaysDummy[indexPath.item].isScrap.toggle()
            }
            return cell
        case .modern:
            let cell = ModernCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(modernDummy[indexPath.item])
            return cell
        case .category:
            let cell = CategoryCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(categoryDummy[indexPath.item])
            return cell
        case .todaysDeal:
            let cell = TodaysDealCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            return cell
        case .summer:
            let cell = RecommendCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(summerDummy[indexPath.item])
            cell.descriptionLabel.font = .NotoBold(size: 12)
            cell.scrapButton.handler = { [weak self] in
                guard let self else { return }
                self.summerDummy[indexPath.item].isScrap.toggle()
            }
            return cell
        case .color:
            let cell = ColorLightCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(colorDummy[indexPath.item])
            cell.scrapButton.handler = { [weak self] in
                guard let self else { return }
                self.colorDummy[indexPath.item].isScrap.toggle()
            }
            return cell
        case .colorBest:
            let cell = ColorBestCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(colorBestDummy[indexPath.item])
            return cell
        case .top10:
            let cell = Top10CollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(top10Dummy[indexPath.item])
            cell.scrapButton.handler = { [weak self] in
                guard let self else { return }
                self.top10Dummy[indexPath.item].isScrap.toggle()
            }
            return cell
        case .review:
            let cell = ReviewCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(reviewDumy[indexPath.item])
            return cell
        case .ideas:
            let cell = TodaysIdeasCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(ideasDummy[indexPath.item])
            return cell
        case .bestSeller:
            let cell = BestSellerCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionType = SectionType.allCases[indexPath.section]
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = SectionTitleCollectionReusableView.dequeueReusableHeaderView(collectionView: collectionView, indexPath: indexPath)
            switch sectionType {
            case .banner, .topCategory:
                return UICollectionReusableView()
            case .best:
                headerView.setSectionTitle(text: I18N.Home.best)
            case .recommend:
                headerView.setRecommendSectionTitle(allRecommendData)
            case .todays:
                headerView.setSectionTitle(text: I18N.Home.todays)
                headerView.ADImageView.isHidden = false
            case .modern:
                headerView.setSectionTitle(text: I18N.Home.modern)
            case .category:
                headerView.setSectionTitle(text: I18N.Home.category)
            case .todaysDeal:
                headerView.setSectionTitle(text: I18N.Home.todaysDeal)
                headerView.moreLabel.isHidden = false
            case .summer:
                headerView.setSectionTitle(text: I18N.Home.summerContent)
            case .color:
                headerView.setSectionTitle(text: I18N.Home.color)
                let fullText = headerView.sectionTitleLabel.text ?? ""
                let attribtuedString = NSMutableAttributedString(string: fullText)
                let range = (fullText as NSString).range(of: "#컬러/레터링조명")
                attribtuedString.addAttribute(.foregroundColor, value: UIColor.main, range: range)
                headerView.sectionTitleLabel.attributedText = attribtuedString
            case .colorBest:
                headerView.setSectionTitle(text: I18N.Home.colorBest)
                let fullText = headerView.sectionTitleLabel.text ?? ""
                let attribtuedString = NSMutableAttributedString(string: fullText)
                let range = (fullText as NSString).range(of: "#컬러/레터링조명")
                attribtuedString.addAttribute(.foregroundColor, value: UIColor.main, range: range)
                headerView.sectionTitleLabel.attributedText = attribtuedString
            case .top10:
                headerView.setSectionTitle(text: I18N.Home.top10)
                headerView.setSectionDescription(text: I18N.Home.top10Description)
                headerView.moreLabel.isHidden = false
            case .review:
                headerView.setSectionTitle(text: I18N.Home.review)
                headerView.moreLabel.text = "업체찾기"
                headerView.moreLabel.isHidden = false
            case .ideas:
                headerView.setSectionTitle(text: I18N.Home.todaysIdeas)
                headerView.moreLabel.isHidden = false
            case .bestSeller:
                headerView.setSectionTitle(text: I18N.Home.bestSellers)
                headerView.moreLabel.isHidden = false
            }
            return headerView
        }
        
        else if kind == UICollectionView.elementKindSectionFooter {
            switch sectionType {
            case .topCategory, .best, .recommend, .todays, .category, .todaysDeal, .colorBest, .top10, .review:
                let footerView = DivisionFooterView.dequeueReusableFooterView(collectionView: collectionView, indexPath: indexPath)
                return footerView
            case .modern, .summer:
                let footerView = MoreButtonFooterView.dequeueReusableFooterView(collectionView: collectionView, indexPath: indexPath)
                return footerView
            case .ideas:
                let footerView = MoreButtonFooterView.dequeueReusableFooterView(collectionView: collectionView, indexPath: indexPath)
                footerView.moreButton.setTitle("기획전 더보기 ", for: .normal)
                return footerView
            case .bestSeller:
                let footerView = HomeFooterView.dequeueReusableFooterView(collectionView: collectionView, indexPath: indexPath)
                footerView.moreButton.setTitle("베스트셀러 더보기 ", for: .normal)
                return footerView
            default:
                return UICollectionReusableView()
            }
        }
        return UICollectionReusableView()
    }
}

private extension HomeViewController {
    func getRecommendAPI() {
        HomeService.shared.getRecommendAPI { networkResult in
            switch networkResult {
            case .success(let data):
                if let data = data as? GenericResponse<RecommendResponseModel> {
                    dump(data)
                    if let allRecommendData = data.data {
                        self.allRecommendData = allRecommendData
                    }
                }
            default:
                break
            }
        }
    }
    
    func getPopularAPI() {
        HomeService.shared.getPopularAPI { networkResult in
            switch networkResult {
            case .success(let data):
                dump(data)
                if let data = data as? GenericResponse<[PopularResponseModel]> {
                    
                    if let allPopularData = data.data {
                        self.allPopularData = allPopularData
                    }
                }
            default:
                break
            }
        }
    }
}
