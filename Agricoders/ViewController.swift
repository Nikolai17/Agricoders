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

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Авторизоваться", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 14
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside )

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
        view.addSubview(button)
        configureView()
    }

    @objc func didTapButton() {
        // Считываем тег
        let mainTabBarController = MainTabBarViewController()
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
}


fileprivate extension ViewController {

    func configureView() {
        button.snp.makeConstraints {
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
