//
//  MainCell.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 17.11.2023.
//

import UIKit
import SnapKit

class MachineOperatorsCell: UICollectionViewCell {

    static let id = "machineOperatorsCell"

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
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        contentView.addSubview(stack)

        spacer.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.width - 64 - fieldLabel.intrinsicContentSize.width - fieldSizeLabel.intrinsicContentSize.width)
        }

        stack.snp.makeConstraints {
            $0.top.equalTo(spacer.snp.bottom).offset(28)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().offset(-16)
        }

        model.workers.forEach { worker in

            let viewFio = FioView()
            stack.addArrangedSubview(viewFio)

            viewFio.config(fio: worker.fio.0, status: worker.fio.1, machine: worker.machine, instr: worker.instr, scopeWork: worker.scopeWork)

            viewFio.snp.makeConstraints {
                $0.height.lessThanOrEqualTo(40)
            }
        }
    }
}
