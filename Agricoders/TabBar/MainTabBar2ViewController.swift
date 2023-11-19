//
//  MainTabBarViewController.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 17.11.2023.
//

import UIKit

class MainTabBar2ViewController: UITabBarController, UITabBarControllerDelegate {

    init() {
        super.init(nibName: nil, bundle: nil)

        modalPresentationStyle = .fullScreen

        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = nil

        delegate = self


        let taskVC = TaskMechanicViewController()
        let profileVC = ProfileMechanicViewController()

        let taskNavigation = UINavigationController(rootViewController: taskVC)
        let profileNavigation = UINavigationController(rootViewController: profileVC)

        viewControllers = [taskNavigation, profileNavigation]
        selectedIndex = 0

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13)], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13)], for: .selected)

        tabBar.tintColor = #colorLiteral(red: 0.5162060261, green: 0.5609516501, blue: 0.008514792658, alpha: 1)
        tabBar.unselectedItemTintColor = .black
        tabBar.isTranslucent = false
    }
}

