//
//  Step2Cell.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 18.11.2023.
//


import UIKit
import SnapKit
import MBRadioCheckboxButton

class Step2Cell: UICollectionViewCell {

    static let id = "step2Cell"

    let imageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "unchecked")
        imageView.image = image
        imageView.tintColor = .black

        return imageView
    }()

    let fieldNameLabel: UILabel = {
        let button = UILabel()
        button.font = UIFont.systemFont(ofSize: 17)

        return button
    }()

    let scopeLabel: UILabel = {
        let button = UILabel()
        button.font = UIFont.systemFont(ofSize: 17)
        button.textColor = #colorLiteral(red: 0.6606984735, green: 0.6606983542, blue: 0.6606983542, alpha: 1)

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
        contentView.addSubview(imageView)
        contentView.addSubview(fieldNameLabel)
        contentView.addSubview(scopeLabel)

        imageView.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview()
            $0.size.equalTo(28)
        }

        fieldNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(imageView.snp.centerY)
            $0.leading.equalTo(imageView.snp.trailing).offset(8)
        }

        scopeLabel.snp.makeConstraints {
            $0.centerY.equalTo(imageView.snp.centerY)

            $0.trailing.equalToSuperview().inset(16)
        }
    }

    func configure(_ model: Step2CellModel) {
        configureImage(model.isChecked)
        fieldNameLabel.text = model.fieldName
        scopeLabel.text = model.scopeText
    }

    func configureImage(_ isChecked: Bool) {
        UIView.animate(withDuration: 0.2) {
            switch isChecked {
            case true:
                self.imageView.image = UIImage(named: "checked")
            case false :
                self.imageView.image = UIImage(named: "unchecked")
            }
        }
    }
}

struct Step2CellModel {
    var isChecked: Bool
    let fieldName: String
    let scopeText: String
}
