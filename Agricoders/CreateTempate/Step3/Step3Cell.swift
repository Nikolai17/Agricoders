//
//  Step3Cell.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 18.11.2023.
//


import UIKit
import SnapKit
import MBRadioCheckboxButton

class Step3Cell: UICollectionViewCell {

    static let id = "step3Cell"

    let button: RadioButton = {
        let button = RadioButton()
        button.radioButtonColor = .init(active: .black, inactive: #colorLiteral(red: 0.6606984735, green: 0.6606983542, blue: 0.6606983542, alpha: 1))
        button.style = .square
        return button
    }()

    let fieldNameLabel: UILabel = {
        let button = UILabel()
        button.font = UIFont.systemFont(ofSize: 17)

        return button
    }()

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
        backgroundColor = .clear
        contentView.addSubview(button)
        contentView.addSubview(fieldNameLabel)

        button.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview()
        }

        fieldNameLabel.snp.makeConstraints {
            $0.leading.equalTo(button.snp.trailing).offset(8)
        }
    }

    func configure(_ model: Step3CellModel) {
        button.isOn = model.isChecked
        fieldNameLabel.text = model.fieldName
    }

    func updateButton() {
        button.isOn = true
    }

    func disableButton() {
        button.isOn = false
        contentView.layoutIfNeeded()
        contentView.setNeedsLayout()
    }
}

struct Step3CellModel {
    let isChecked: Bool
    let fieldName: String
}

struct Step4CellModel {
    let isChecked: Bool
    let fieldName: String
    let status: WorkStatus?
}
