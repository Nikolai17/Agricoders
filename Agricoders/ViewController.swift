//
//  ViewController.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 17.11.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    //    let nfc = NFCUtility.shared

    private lazy var button1: UIButton = {
        let button = UIButton()
        button.setTitle("Авторизоваться агрономом", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 14
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapButton1), for: .touchUpInside )

        return button
    }()

    private lazy var button2: UIButton = {
        let button = UIButton()
        button.setTitle("Авторизоваться механизатором", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 14
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapButton2), for: .touchUpInside )

        return button
    }()

    private lazy var imageView: UIImageView = {
        let view = UIImageView()

        view.image = UIImage(named: "launch")

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(imageView)
        view.addSubview(button1)
        view.addSubview(button2)

        configureView()
    }

    @objc func didTapButton1() {
        // Считываем тег
        let mainTabBarController = MainTabBarViewController()
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }

    @objc func didTapButton2() {
        // Считываем тег
        let mainTabBarController = MainTabBar2ViewController()
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
}


fileprivate extension ViewController {

    func configureView() {
        button1.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }

        button2.snp.makeConstraints {
            $0.top.equalTo(button1.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(59)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }

        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
