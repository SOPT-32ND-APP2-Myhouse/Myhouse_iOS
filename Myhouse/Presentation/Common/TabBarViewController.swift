//
//  TabBarViewController.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/15.
//

import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: - Properties
    
    let TabBarHeight: CGFloat = 87
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setTabBarHeight()
    }
}

// MARK: - Extensions

private extension TabBarController {
    func setTabBarHeight() {
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = TabBarHeight
        tabFrame.origin.y = self.view.frame.size.height - TabBarHeight
        self.tabBar.frame = tabFrame
    }
    
    func makeTabBar(
        viewController: UIViewController,
        title: String,
        tabBarImg: UIImage,
        tabBarSelectedImg: UIImage,
        renderingMode: UIImage.RenderingMode
    ) -> UIViewController {
        
        let tab = UINavigationController(rootViewController: viewController)
        tab.isNavigationBarHidden = true
        tab.tabBarItem = UITabBarItem(title: title,
                                      image: tabBarImg.withRenderingMode(renderingMode),
                                      selectedImage: tabBarSelectedImg.withRenderingMode(renderingMode))
        return tab
    }
    
    func setTabBar() {
        let home = makeTabBar(viewController: HomeViewController(),
                              title: "",
                              tabBarImg: ImageLiterals.TabBar.icn_home,
                              tabBarSelectedImg: ImageLiterals.TabBar.icn_home_selected,
                              renderingMode: .alwaysOriginal)
        let look = makeTabBar(viewController: LookViewController(),
                              title: "",
                              tabBarImg: ImageLiterals.TabBar.icn_look,
                              tabBarSelectedImg: ImageLiterals.TabBar.icn_look_selected,
                              renderingMode: .alwaysOriginal)
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
