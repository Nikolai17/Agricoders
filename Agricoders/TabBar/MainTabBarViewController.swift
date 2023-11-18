//
//  MainTabBarViewController.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 17.11.2023.
//

import UIKit

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {

    init() {
        super.init(nibName: nil, bundle: nil)

        modalPresentationStyle = .fullScreen

        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = nil

        delegate = self


        let targetVC = MainViewController()
        let machineOperatorsVC = MachineOperatorsViewController()
        let carsVC = CarsViewController()
        let profileVC = ProfileViewController()

        let targetNavigation = UINavigationController(rootViewController: targetVC)
        let machineOperatorsNavigation = UINavigationController(rootViewController: machineOperatorsVC)
        let carsNavigation = UINavigationController(rootViewController: carsVC)
        let profileNavigation = UINavigationController(rootViewController: profileVC)

        viewControllers = [targetNavigation, machineOperatorsNavigation, carsNavigation, profileNavigation]
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

