//
//  SceneDelegate.swift
//  Myhouse
//
//  Created by Minjoo Kim on 2023/05/13.
//
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
            window?.rootViewController = UINavigationController(rootViewController: DetailViewController())
            window?.makeKeyAndVisible()
    }
}
