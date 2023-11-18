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

    private lazy var label: UILabel = {
        var label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 34)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.01
        // Line height: 41 pt
        // (identical to box height)
        label.attributedText = NSMutableAttributedString(string: "AGRICODERS", attributes: [NSAttributedString.Key.kern: 0.37, NSAttributedString.Key.paragraphStyle: paragraphStyle])

        return label
    }()

    private lazy var label2: UILabel = {
        var label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 257, height: 20)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 15)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.12
        // Line height: 20 pt
        // (identical to box height)
        label.attributedText = NSMutableAttributedString(string: "АРМ АГРОНОМА / МЕХАНИЗАТОРА", attributes: [NSAttributedString.Key.kern: -0.5, NSAttributedString.Key.paragraphStyle: paragraphStyle])

        return label
    }()

    private lazy var imageView: UIImageView = {
        let view = UIImageView()

        view.image = UIImage(named: "auth")

        return view

    }()

    private lazy var stackView: UIStackView = {
        let stakView = UIStackView()
        stakView.axis = .vertical
        stakView.alignment = .center
        stakView.addArrangedSubview(label)
        stakView.addArrangedSubview(label2)

        return stakView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.6550073028, green: 0.7082381845, blue: 0.04327847064, alpha: 1)
        view.addSubview(imageView)
        view.addSubview(button)
        view.addSubview(stackView)
        configureView()
    }

    @objc func didTapButton() {
        // Считываем тег

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = MainTabBarViewController()

        // This is to get the SceneDelegate object from your view controller
        // then call the change root view controller function to change to main tab bar
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
}


fileprivate extension ViewController {

    func configureView() {
        stackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }

        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(59)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }

        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}
