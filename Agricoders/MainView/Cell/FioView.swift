//
//  FioView.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 18.11.2023.
//

import UIKit
import SnapKit

class FioView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    let fioLabel:  UILabel = {
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

    override func draw(_ rect: CGRect) {
        addSubview(fioLabel)
        addSubview(imageView)
        addSubview(statusLabel)

        addSubview(carLabel)
        addSubview(instLabel)
        addSubview(scopeWorkLabel)

        fioLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }

        statusLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
        }

        imageView.snp.makeConstraints {
            $0.trailing.equalTo(statusLabel.snp.leading).offset(-6)
            $0.size.equalTo(7)
            $0.centerY.equalTo(statusLabel.snp.centerY)
        }

        carLabel.snp.makeConstraints {
            $0.top.equalTo(fioLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
        }

        instLabel.snp.makeConstraints {
            $0.centerY.equalTo(carLabel)
            $0.centerX.equalToSuperview()
        }

        scopeWorkLabel.snp.makeConstraints {
            $0.centerY.equalTo(carLabel)
            $0.trailing.equalToSuperview()
        }
    }

    func config(fio: String, status: WorkStatus, machine: Machine, instr: Insrument, scopeWork: String) {
        fioLabel.text = fio
        carLabel.text = machine.rawValue
        instLabel.text = instr.rawValue
        scopeWorkLabel.text = scopeWork

        switch status {
        case .disable:
            imageView.tintColor = #colorLiteral(red: 0.9565835595, green: 0.7734739184, blue: 0, alpha: 1)
            statusLabel.text = WorkStatus.disable.rawValue

        case.enable:
            imageView.tintColor = #colorLiteral(red: 0.6550073028, green: 0.7082381845, blue: 0.04327847064, alpha: 1)
            statusLabel.text = WorkStatus.enable.rawValue
        }
    }
}
