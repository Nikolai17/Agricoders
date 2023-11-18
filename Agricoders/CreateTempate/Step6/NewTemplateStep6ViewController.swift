//
//  NewTemplateStep6ViewController.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 18.11.2023.
//

import UIKit
import SnapKit

class NewTemplateStep6ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    init() {
        super.init(nibName: nil, bundle: nil)
      }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Создать задание", for: .normal)
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        button.backgroundColor = .agro
        button.round(with: .both, radius: 10)
        button.layer.masksToBounds = true
        button.setTitleColor(.systemGray, for: .disabled)

        return button
    }()

    let progressView = UIProgressView()
    let segmentedControl = UISegmentedControl(items: ["Сегодня, 9:41", "Завтра, 9:41", "Послезавтра"])

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).adjustsFontSizeToFitWidth = true
        title = "Проверьте данные задания"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath) as? Step4Cell
//
//        cell?.updateButton()
//        continueButton.isEnabled = true
//    }

//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath) as? Step4Cell
//
//        cell?.disableButton()
//    }
//
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return templateStep6Object.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Step6Cell.id, for: indexPath) as? Step6Cell else { return UICollectionViewCell()}
        let model = templateStep6Object[indexPath.row]
        cell.configure(model)
        cell.backgroundColor = .white

        return cell
    }

    lazy var collection: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 60)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20
        let collection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.showsHorizontalScrollIndicator = false
        
        collection.register(Step6Cell.self, forCellWithReuseIdentifier: Step6Cell.id)

        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    func setUp() {
        progressView.setProgress(1, animated: true)
        progressView.progressTintColor = .agro
        view.backgroundColor = .white

        view.addSubview(continueButton)
        view.addSubview(progressView)
        view.addSubview(collection)

        addControl()

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .agro

        progressView.snp.makeConstraints {
            $0.height.equalTo(4)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }

        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(progressView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }

        collection.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(8)
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

    func addControl()  {
        segmentedControl.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        segmentedControl.selectedSegmentTintColor = .agro
        segmentedControl.layer.cornerRadius = 15
        view.addSubview(segmentedControl)
    }

    @objc func segmentAction(_ segmentedControl: UISegmentedControl) {
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            break // Uno
        case 1:
            break // Dos
        case 2:
            break // Tres
        default:
            break
        }
    }

    @objc func buttonDidTap() {
        navigationController?.dismiss(animated: true)
    }
}
