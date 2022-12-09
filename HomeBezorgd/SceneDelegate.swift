//
//  SceneDelegate.swift
//  HomeBezorgd
//
//  Created by Julian de Haas on 09/12/2022.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
    
    lazy var storyBoardViewController: UINavigationController = {
        let navController = UINavigationController(rootViewController: ViewController())
      navController.view.backgroundColor = .systemBackground
      return navController
    }()

  lazy var authNavController: UINavigationController = {
    let navController = UINavigationController(rootViewController: AuthViewController())
    navController.view.backgroundColor = .systemBackground
    return navController
  }()

  lazy var userNavController: UINavigationController = {
    let navController = UINavigationController(rootViewController: UserViewController())
    navController.view.backgroundColor = .systemBackground
    return navController
  }()

  lazy var tabBarController: UITabBarController = {
    let tabBarController = UITabBarController()
    tabBarController.delegate = tabBarController
    tabBarController.view.backgroundColor = .systemBackground
    return tabBarController
  }()

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
             options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }

    configureControllers()

    window = UIWindow(windowScene: windowScene)
    window?.rootViewController = tabBarController
    window?.makeKeyAndVisible()
  }

  // MARK: - Private Helpers

  private func configureControllers() {
    authNavController.configureTabBar(
      title: "Authentication",
      systemImageName: "person.crop.circle.fill.badge.plus"
    )
    userNavController.configureTabBar(title: "Current User", systemImageName: "person.fill")
      
      storyBoardViewController.configureTabBar(title: "WebKit", systemImageName: "safari")
    
      
    tabBarController.viewControllers = [authNavController, userNavController, storyBoardViewController]
  }
}
