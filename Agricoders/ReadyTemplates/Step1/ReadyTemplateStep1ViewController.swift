//
//  ReadyTemplateStep1ViewController.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 18.11.2023.
//

import UIKit
import SnapKit

class ReadyTemplateStep1ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    init() {
        super.init(nibName: nil, bundle: nil)
      }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let progressView = UIProgressView()

    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Далее", for: .normal)
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        button.backgroundColor = .agro
        button.round(with: .both, radius: 10)
        button.layer.masksToBounds = true
        button.setTitleColor(.systemGray, for: .disabled)

        return button
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        title = "Выберите шаблон"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? ReadyTemplateStep1Cell

    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? ReadyTemplateStep1Cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return readyTemplateStep1Object.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReadyTemplateStep1Cell.id, for: indexPath) as? ReadyTemplateStep1Cell else { return UICollectionViewCell()}
        let model = readyTemplateStep1Object[indexPath.row]
        cell.configure(model)
        cell.backgroundColor = .clear

        return cell
    }

    lazy var collection: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 30)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20
        
        let collection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.showsHorizontalScrollIndicator = false

        collection.register(ReadyTemplateStep1Cell.self, forCellWithReuseIdentifier: ReadyTemplateStep1Cell.id)

        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    func setUp() {
        progressView.setProgress(0, animated: true)
        progressView.progressTintColor = .agro

        view.backgroundColor = #colorLiteral(red: 0.9404773116, green: 0.940477252, blue: 0.940477252, alpha: 1)

        view.addSubview(progressView)
        view.addSubview(collection)
        view.addSubview(continueButton)

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .never

        progressView.snp.makeConstraints {
            $0.height.equalTo(4)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }

        collection.snp.makeConstraints {
            $0.top.equalTo(progressView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(continueButton.snp.top).offset(10)
        }

        continueButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(40)
            $0.height.equalTo(50)
        }
    }

    @objc func buttonDidTap() {
        let viewController = NewTemplateStep2ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
