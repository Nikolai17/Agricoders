//
//  FioView.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 18.11.2023.
//

import UIKit
import SnapKit

class MachineOperatorsDescriptionView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    let fieldLabel:  UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8829969191)

        return label
    }()

    let scopeLabel:  UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = #colorLiteral(red: 0.3872469664, green: 0.3872469068, blue: 0.3872469068, alpha: 1)

        return label
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

    override func draw(_ rect: CGRect) {
        addSubview(fieldLabel)
        addSubview(scopeLabel)
        addSubview(carLabel)
        addSubview(instLabel)
        addSubview(scopeWorkLabel)

        fieldLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }

        scopeLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
        }

        carLabel.snp.makeConstraints {
            $0.top.equalTo(fieldLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
        }

        instLabel.snp.makeConstraints {
            $0.centerY.equalTo(carLabel)
            $0.centerX.equalToSuperview()
        }

        scopeWorkLabel.snp.makeConstraints {
            $0.centerY.equalTo(carLabel)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }
    }

    func config(fieldName: String, scopeText: String, machine: Machine, instr: Insrument, scopeWork: String) {
        fieldLabel.text = fieldName
        scopeLabel.text = scopeText
        carLabel.text = machine.rawValue
        instLabel.text = instr.rawValue
        scopeWorkLabel.text = scopeWork
    }
}
