// TabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Таб-бар контроллер
final class TabBarController: UITabBarController {
    // MARK: - Constants

    private enum Constants {
        static let feedTabBarTitle = "Лента"
        static let feedTabBarImage = UIImage.homePage
        static let notificationsTabBarTitle = "Уведомления"
        static let notificationsTabBarImage = UIImage.notifications
        static let userProfileTabBarTitle = "Профиль"
        static let userProfileTabBarImage = UIImage.profile
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    // MARK: - Private Methods

    private func setupTabBar() {
        let feedController = FeedViewController()
        let notificationsController = NotificationsViewController()
        let userProfileController = UserProfileViewController()

        let feedNavigationController = UINavigationController(rootViewController: feedController)

        let notificationsNavController = UINavigationController(rootViewController: notificationsController)

        feedNavigationController.tabBarItem = UITabBarItem(
            title: Constants.feedTabBarTitle,
            image: Constants.feedTabBarImage,
            selectedImage: Constants.feedTabBarImage
        )
        notificationsNavController.tabBarItem = UITabBarItem(
            title: Constants.notificationsTabBarTitle,
            image: Constants.notificationsTabBarImage,
            selectedImage: Constants.notificationsTabBarImage.withTintColor(.black, renderingMode: .alwaysTemplate)
        )

        userProfileController.tabBarItem = UITabBarItem(
            title: Constants.userProfileTabBarTitle,
            image: Constants.userProfileTabBarImage,
            selectedImage: Constants.userProfileTabBarImage.withTintColor(.black, renderingMode: .alwaysTemplate)
        )
        setViewControllers(
            [feedNavigationController, notificationsNavController, userProfileController],
            animated: true
        )
    }
}
