//
//  TaskMechanicViewController.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 17.11.2023.
//

import UIKit

class TaskMechanicViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(title: "Поля", image: UIImage(named: "field")?.withRenderingMode(.alwaysTemplate), tag: 0)
      }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let segmentedControl = UISegmentedControl(items: ["Сегодня", "Завтра", "Послезавтра", "Выполнено"])

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        title = "Задания"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? TaskStep1Cell
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? TaskStep1Cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return taskStep1Objects.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaskStep1Cell.id, for: indexPath) as? TaskStep1Cell else { return UICollectionViewCell()}
        let model = taskStep1Objects[indexPath.row]
        cell.configure(model)
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        cell.delegate = self
        cell.tag = indexPath.row

        return cell
    }

    lazy var collection: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20

        let collection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.showsHorizontalScrollIndicator = false

        collection.register(TaskStep1Cell.self, forCellWithReuseIdentifier: TaskStep1Cell.id)

        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()


    func setUp() {
        view.backgroundColor = #colorLiteral(red: 0.9404773116, green: 0.940477252, blue: 0.940477252, alpha: 1)

        let search = UIBarButtonItem(image: UIImage(named: "search")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action:  #selector(searchTapped))
        let notification = UIBarButtonItem(image: UIImage(named: "notification")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action:  #selector(notificationTapped))
        navigationItem.rightBarButtonItems = [search, notification]

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .never

        view.addSubview(collection)

        collection.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.edges.equalToSuperview()
        }
    }

    @objc func searchTapped() {

    }

    @objc func notificationTapped() {

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
}

// MARK: - TaskStep1CellDelegate

extension TaskMechanicViewController: TaskStep1CellDelegate {
    func didTapContinueButton(_ tag: Int) {
        taskStep1Objects.remove(at: tag)
        collection.reloadData()
    }
    
    func didTapCancelButton(_ tag: Int) {
        taskStep1Objects.remove(at: tag)
        collection.reloadData()
    }
}
