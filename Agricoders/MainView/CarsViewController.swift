//
//  CarsViewController.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 18.11.2023.
//

import UIKit

class CarsViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(title: "Техника", image: UIImage(named: "tractor")?.withRenderingMode(.alwaysTemplate), tag: 2)
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
        title = "Техника"

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .never
    }
}
