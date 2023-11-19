//
//  TaskStep1Cell.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 18.11.2023.
//


import UIKit
import SnapKit

protocol TaskStep1CellDelegate: AnyObject {
    func didTapContinueButton(_ tag: Int)
    func didTapCancelButton(_ tag: Int)
}

class TaskStep1Cell: UICollectionViewCell {

    static let id = "taskStep1Cell"

    let taskView: TaskView = {
        let view = TaskView()

        return view
    }()
    
    weak var delegate: TaskStep1CellDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
        fatalError("init(coder:) has not been implemented")
    }

    func setUp() {
        taskView.delegate = self
        contentView.addSubview(taskView)

        taskView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(380)
        }
    }

    func configure(_ model: TaskStep1Model) {
        taskView.config(model)
    }
}

// MARK: - TaskViewDelegate

extension TaskStep1Cell: TaskViewDelegate {

    func didTapContinueButton() {
        delegate?.didTapContinueButton(tag)
    }

    func didTapCancelButton() {
        delegate?.didTapCancelButton(tag)
    }
}
