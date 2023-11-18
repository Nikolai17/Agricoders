//
//  MachineOperatorsViewController.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 18.11.2023.
//

import UIKit

class MachineOperatorsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {

    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(title: "Механизаторы", image: UIImage(named: "people")?.withRenderingMode(.alwaysTemplate), tag: 1)
      }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Выбрана ячейка \(indexPath.row)")
        showAlert()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objects2.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MachineOperatorsCell.id, for: indexPath) as? MachineOperatorsCell else { return UICollectionViewCell()}
        let model = objects2[indexPath.row]
        cell.configure(model)
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true

        return cell
    }

    lazy var collection: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 200)
        let collection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.showsHorizontalScrollIndicator = false

        collection.register(MachineOperatorsCell.self, forCellWithReuseIdentifier: MachineOperatorsCell.id)

        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    func setUp() {
        view.addSubview(collection)
        view.backgroundColor = #colorLiteral(red: 0.9404773116, green: 0.940477252, blue: 0.940477252, alpha: 1)
        title = "Механизаторы"

        let search = UIBarButtonItem(image: UIImage(named: "search")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action:  #selector(searchTapped))
        let notification = UIBarButtonItem(image: UIImage(named: "notification")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action:  #selector(notificationTapped))
        navigationItem.rightBarButtonItems = [search, notification]

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .never

        collection.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    @objc func searchTapped() {

    }

    @objc func notificationTapped() {

    }
}

// MARK: - Private methods

fileprivate extension MachineOperatorsViewController {

    func useTemplateTapped() {

    }

    func createTemplateTapped() {
        let viewController = NewTemplateViewController()
        let navController = UINavigationController(rootViewController: viewController)

        self.present(navController, animated:true, completion: nil)
    }

    func showAlert() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        let attributedText = NSMutableAttributedString(string: "Создать задание")

        let range = NSRange(location: 0, length: attributedText.length)
        attributedText.addAttribute(NSAttributedString.Key.kern, value: 1.5, range: range)
        attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 20), range: range)


        alert.addAction(
            UIAlertAction(
                title: "Использовать шаблон",
                style: .default ,
                handler: { [weak self] _ in
                    self?.useTemplateTapped()
                }
            )
        )

        alert.addAction(
            UIAlertAction(
                title: "Создать новое",
                style: .default,
                handler:{ [weak self] _ in
                    self?.createTemplateTapped()
                }
            )
        )

        present(alert, animated: true, completion: nil)

        alert.setValue(attributedText, forKey: "attributedTitle")
    }
}
