//
//  TabBarViewController.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/15.
//

import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: - Properties
    
    private var homeViewController: UIViewController?
    private var lookViewController: UIViewController?
    private var shoppingViewController: UIViewController?
    private var lifeViewController: UIViewController?
    private var myPageViewController: UIViewController?
    
    // MARK: - UI Components
    
    private lazy var scrapButton = ScrapButton()
    private let scrapPopUpView = ScrapPopUpView()
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBar()
        setDelegate()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
}

// MARK: - Extensions

private extension TabBarController {
    func setLayout() {
        self.view.addSubviews(scrapPopUpView)
        
        scrapPopUpView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(-82)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(82)
        }
    }
    
    func makeTabBar(
        viewController: UIViewController,
        title: String,
        tabBarImg: UIImage,
        tabBarSelectedImg: UIImage,
        renderingMode: UIImage.RenderingMode
        ) -> UIViewController {
        
        let tab = UINavigationController(rootViewController: viewController)
        tab.tabBarItem = UITabBarItem(title: title,
                                      image: tabBarImg.withRenderingMode(renderingMode),
                                      selectedImage: tabBarSelectedImg.withRenderingMode(renderingMode))
        return tab
    }
    
    func setDelegate() {
        guard let lookViewController = self.lookViewController as? LookViewController else { return }
        lookViewController.scrapButtonTapped = { self.scrapCVCButtonTapped() }
        scrapPopUpView.delegate = self
    }
    
    func setTabBar() {
        let homeViewController = HomeViewController()
        let home = makeTabBar(viewController: homeViewController,
                              title: "",
                              tabBarImg: ImageLiterals.TabBar.icn_home,
                              tabBarSelectedImg: ImageLiterals.TabBar.icn_home_selected,
                              renderingMode: .alwaysOriginal)
        self.homeViewController = homeViewController
        let lookViewController = LookViewController()
        let look = makeTabBar(viewController: lookViewController,
                              title: "",
                              tabBarImg: ImageLiterals.TabBar.icn_look,
                              tabBarSelectedImg: ImageLiterals.TabBar.icn_look_selected,
                              renderingMode: .alwaysOriginal)
        self.lookViewController = lookViewController
        let shopping = makeTabBar(viewController: ShoppingViewController(),
                                  title: "",
                                  tabBarImg: ImageLiterals.TabBar.icn_shopping,
                                  tabBarSelectedImg: ImageLiterals.TabBar.icn_shopping_selected,
                                  renderingMode: .alwaysOriginal)
        let life = makeTabBar(viewController: LifeViewController(),
                              title: "",
                              tabBarImg: ImageLiterals.TabBar.icn_life,
                              tabBarSelectedImg: ImageLiterals.TabBar.icn_life_selected,
                              renderingMode: .alwaysOriginal)
        
        let myPage = makeTabBar(viewController: MyPageViewController(),
                                title: "",
                                tabBarImg: ImageLiterals.TabBar.icn_myPage,
                                tabBarSelectedImg: ImageLiterals.TabBar.icn_myPage_selected,
                                renderingMode: .alwaysOriginal)
        
        let tabs = [home, look, shopping, life, myPage]
        self.setViewControllers(tabs, animated: false)
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
    }
}

extension TabBarController: ScrapCVCDelegate {
    func scrapCVCButtonTapped() {
        self.scrapPopUpView.snp.updateConstraints { $0.bottom.equalToSuperview() }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                self.scrapPopUpView.snp.updateConstraints { $0.bottom.equalToSuperview().inset(-82) }
                UIView.animate(withDuration: 0.3) {
                    self.view.layoutIfNeeded()
                }
            })
        }
    }
}

extension TabBarController: ScrapPopUpDelegate {
    func scrapBookButtonTapped() {
        let scrapViewController = ScarpViewController()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(scrapViewController, animated: false)
    }
    
    func folderButtonTapped() {
        let folderViewController = FolderBottomSheetViewController()
        folderViewController.modalTransitionStyle = .coverVertical
        folderViewController.modalPresentationStyle = .overFullScreen
        self.present(folderViewController, animated: false)
    }
}
