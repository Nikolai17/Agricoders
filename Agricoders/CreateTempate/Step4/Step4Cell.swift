//
//  Step4Cell.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 18.11.2023.
//


import UIKit
import SnapKit
import MBRadioCheckboxButton

class Step4Cell: UICollectionViewCell {

    static let id = "step4Cell"

    let button: RadioButton = {
        let button = RadioButton()
        button.radioButtonColor = .init(active: .black, inactive: #colorLiteral(red: 0.6606984735, green: 0.6606983542, blue: 0.6606983542, alpha: 1))
        button.style = .square
        return button
    }()

    let agregatName: UILabel = {
        let button = UILabel()
        button.font = UIFont.systemFont(ofSize: 17)

        return button
    }()

    let statusLabel:  UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = #colorLiteral(red: 0.3872469664, green: 0.3872469068, blue: 0.3872469068, alpha: 1)

        return label
    }()

    let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "ellipse")

        return view
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
        contentView.addSubview(agregatName)
        contentView.addSubview(statusLabel)
        contentView.addSubview(imageView)

        button.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview()
        }

        agregatName.snp.makeConstraints {
            $0.leading.equalTo(button.snp.trailing).offset(8)
        }

        imageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(100)
            $0.size.equalTo(7)
            $0.centerY.equalTo(statusLabel.snp.centerY)
        }

        statusLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(imageView.snp.trailing).offset(8)
        }
    }

    func configure(_ model: Step4CellModel) {
        button.isOn = model.isChecked
        agregatName.text = model.fieldName

        switch model.status {
        case .disable:
            imageView.tintColor = #colorLiteral(red: 0.9565835595, green: 0.7734739184, blue: 0, alpha: 1)
            statusLabel.text = WorkStatus.disable.rawValue

        case.enable:
            imageView.tintColor = #colorLiteral(red: 0.6550073028, green: 0.7082381845, blue: 0.04327847064, alpha: 1)
            statusLabel.text = WorkStatus.enable.rawValue

        case .none:
            imageView.tintColor = .clear
        }
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
