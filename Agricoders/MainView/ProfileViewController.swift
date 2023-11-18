//
//  ProfileViewController.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 18.11.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "profile")?.withRenderingMode(.alwaysTemplate), tag: 3)
      }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    func setUp() {
        view.backgroundColor = .white
        title = "Профиль"

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .never
    }
}

