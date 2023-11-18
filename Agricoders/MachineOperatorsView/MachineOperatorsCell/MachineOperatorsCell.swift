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

    let fioStatusView = FioStatusView()
    let descriptionView = MachineOperatorsDescriptionView()

    let vStack1: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10

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
        divider.backgroundColor = #colorLiteral(red: 0.9404773116, green: 0.940477252, blue: 0.940477252, alpha: 1)

        contentView.addSubview(vStack1)
        vStack1.addArrangedSubview(fioStatusView)
        vStack1.addArrangedSubview(divider)
        vStack1.addArrangedSubview(descriptionView)

        vStack1.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(16)
        }

        fioStatusView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.lessThanOrEqualTo(20)
        }

        divider.snp.makeConstraints {
            $0.height.equalTo(1)
        }

        descriptionView.snp.makeConstraints {
            $0.height.lessThanOrEqualTo(40)
        }
    }

    func configure(_ model: MachineOperatorsModels) {
        fioStatusView.config(fio: model.fio.0, status: model.fio.1)
        descriptionView.config(fieldName: model.field.0, scopeText: model.field.1, machine: model.machine, instr: model.instr, scopeWork: model.scopeWork)
    }
}
