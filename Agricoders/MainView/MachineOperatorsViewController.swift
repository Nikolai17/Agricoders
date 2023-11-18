//
//  MachineOperatorsViewController.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 18.11.2023.
//

import UIKit

class MachineOperatorsViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(title: "Механизаторы", image: UIImage(named: "people")?.withRenderingMode(.alwaysTemplate), tag: 1)
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
        title = "Механизаторы"

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .never
    }
}
