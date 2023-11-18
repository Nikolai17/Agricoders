//
//  MainCell.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 17.11.2023.
//

import UIKit
import SnapKit

class MainCell: UICollectionViewCell {

    static let id = "mainCell"

    let spacer = UIView()
    let divider = UIView()

    let fieldLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)

        return label
    }()

    let fieldSizeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = #colorLiteral(red: 0.6606984735, green: 0.6606983542, blue: 0.6606983542, alpha: 1)

        return label
    }()

    let vStack1: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical

        return stack
    }()

    let hStack1: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal

        return stack
    }()

    let fio:  UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8829969191)

        return label
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

    let carLabel:  UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = #colorLiteral(red: 0.6606984735, green: 0.6606983542, blue: 0.6606983542, alpha: 1)

        return label
    }()

    let instLabel:  UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = #colorLiteral(red: 0.6606984735, green: 0.6606983542, blue: 0.6606983542, alpha: 1)

        return label
    }()

    let scopeWorkLabel:  UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = #colorLiteral(red: 0.6606984735, green: 0.6606983542, blue: 0.6606983542, alpha: 1)

        return label
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
        divider.backgroundColor = .gray

        hStack1.addArrangedSubview(fieldLabel)
        hStack1.addArrangedSubview(spacer)
        hStack1.addArrangedSubview(fieldSizeLabel)

        contentView.layer.cornerRadius = 12
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 0.3


        contentView.addSubview(hStack1)
        contentView.addSubview(divider)
        contentView.addSubview(fio)
        contentView.addSubview(imageView)
        contentView.addSubview(statusLabel)
        contentView.addSubview(carLabel)
        contentView.addSubview(instLabel)
        contentView.addSubview(scopeWorkLabel)

        hStack1.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }

        divider.snp.makeConstraints {
            $0.top.equalTo(hStack1.snp.bottom).offset(14)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(1)
        }
    }

    func configure(_ model: AgroObject) {
        fieldLabel.text = model.field.0
        fieldSizeLabel.text = model.field.1

        spacer.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.width - 64 - fieldLabel.intrinsicContentSize.width - fieldSizeLabel.intrinsicContentSize.width)
        }

        model.workers.forEach { worker in
            fio.text = worker.fio.0

            if worker.fio.1 == .disable {
                imageView.tintColor = #colorLiteral(red: 0.9565835595, green: 0.7734739184, blue: 0, alpha: 1)
            } else {
                imageView.tintColor = #colorLiteral(red: 0.6550073028, green: 0.7082381845, blue: 0.04327847064, alpha: 1)
            }

            statusLabel.text = worker.fio.1.rawValue
            carLabel.text = worker.machine.rawValue
            instLabel.text = worker.instr.rawValue
            scopeWorkLabel.text = worker.scopeWork

            fio.snp.makeConstraints {
                $0.top.equalTo(spacer.snp.bottom).offset(28)
                $0.leading.equalToSuperview().offset(16)
            }

            statusLabel.snp.makeConstraints {
                $0.top.equalTo(spacer.snp.bottom).offset(28)
                $0.trailing.equalToSuperview().inset(16)
            }

            imageView.snp.makeConstraints {
                $0.trailing.equalTo(statusLabel.snp.leading).offset(-6)
                $0.size.equalTo(7)
                $0.centerY.equalTo(statusLabel.snp.centerY)
            }

            carLabel.snp.makeConstraints {
                $0.top.equalTo(fio.snp.bottom).offset(10)
                $0.leading.equalToSuperview().offset(16)
            }

            instLabel.snp.makeConstraints {
                $0.centerY.equalTo(carLabel)
                $0.centerX.equalToSuperview()
            }

            scopeWorkLabel.snp.makeConstraints {
                $0.centerY.equalTo(carLabel)
                $0.trailing.equalToSuperview().inset(16)
            }
        }
    }
}
