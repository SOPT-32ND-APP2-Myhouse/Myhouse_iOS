//
//  LookViewController.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/15.
//

import UIKit

final class LookViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private let lookView = LookView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = lookView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationUI()
        setNotificationCenter()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - Extensions

extension LookViewController {
    
    func setNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(CellTapped(_:)), name: Notification.Name("CellTappedNotification"), object: nil)
    }
    
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
        self.navigationController?.pushViewController(scrapViewController, animated: true)
    }
    
    @objc func CellTapped(_ notification: Notification) {
        self.navigationController?.pushViewController(DetailViewController(), animated: true)
    }
}

extension LookViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
