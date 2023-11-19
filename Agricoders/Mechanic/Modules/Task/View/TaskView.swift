//
//  TaskView.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 18.11.2023.
//

import UIKit
import SnapKit

protocol TaskViewDelegate: AnyObject {
    func didTapContinueButton()
    func didTapCancelButton()
}

class TaskView: UIView {

    weak var delegate: TaskViewDelegate?

    let separator = UIView()

    let workLabel:  UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)

        return label
    }()

    let workSizeLabel:  UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)

        return label
    }()

    let carLabel:  UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = #colorLiteral(red: 0.6606984735, green: 0.6606983542, blue: 0.6606983542, alpha: 1)

        return label
    }()

    let carParametrLabel:  UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = #colorLiteral(red: 0.6606984735, green: 0.6606983542, blue: 0.6606983542, alpha: 1)

        return label
    }()

    let carLabel2:  UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = #colorLiteral(red: 0.6606984735, green: 0.6606983542, blue: 0.6606983542, alpha: 1)

        return label
    }()

    let carParametrLabel2:  UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = #colorLiteral(red: 0.6606984735, green: 0.6606983542, blue: 0.6606983542, alpha: 1)

        return label
    }()

    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Начать работу", for: .normal)
        button.addTarget(self, action: #selector(buttonDidTap1), for: .touchUpInside)
        button.backgroundColor = .agro
        button.round(with: .both, radius: 10)
        button.layer.masksToBounds = true
        button.setTitleColor(.systemGray, for: .disabled)

        return button
    }()

    private lazy var continueButton2: UIButton = {
        let button = UIButton()
        button.setTitle("Не могу выполнить", for: .normal)
        button.setTitleColor(.agro, for: .normal)
        button.addTarget(self, action: #selector(buttonDidTap2), for: .touchUpInside)
        button.backgroundColor = .clear
        button.round(with: .both, radius: 10)
        button.layer.masksToBounds = true
        button.setTitleColor(.systemGray, for: .disabled)

        return button
    }()

    let timerView: TaskStep2View = {
        let view = TaskStep2View()
        view.isHidden = true
        return view
    }()


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        configUI()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        configUI()
    }

    func configUI() {

        separator.backgroundColor = .lightGray

        addSubview(workLabel)
        addSubview(workSizeLabel)
        addSubview(carLabel)
        addSubview(carParametrLabel)
        addSubview(carLabel2)
        addSubview(carParametrLabel2)

        addSubview(separator)
        addSubview(continueButton)
        addSubview(continueButton2)
        addSubview(timerView)

        backgroundColor = .white

        workLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(16)
        }

        workSizeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }

        separator.snp.makeConstraints {
            $0.top.equalTo(workLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(1)
        }

        carLabel.snp.makeConstraints {
            $0.top.equalTo(separator.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(16)
        }

        carParametrLabel.snp.makeConstraints {
            $0.centerY.equalTo(carLabel)
            $0.trailing.equalToSuperview().inset(16)
        }

        carLabel2.snp.makeConstraints {
            $0.top.equalTo(carLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(16)
        }

        carParametrLabel2.snp.makeConstraints {
            $0.centerY.equalTo(carLabel2)
            $0.trailing.equalToSuperview().inset(16)
        }

        continueButton.snp.makeConstraints {
            $0.top.equalTo(carLabel2.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }

        continueButton2.snp.makeConstraints {
            $0.top.equalTo(continueButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }

        timerView.snp.makeConstraints {
//            $0.top.equalTo(continueButton2.snp.bottom).offset(16)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-35)
            $0.height.equalTo(70)
        }
    }

    func config(_ model: TaskStep1Model) {
        workLabel.text = model.work
        workSizeLabel.text = model.workSize
        carLabel.text = model.car1
        carParametrLabel.text = model.carParametr1
        carLabel2.text = model.car2
        carParametrLabel2.text = model.carParametr2
    }

    @objc func buttonDidTap1() {
        continueButton.isHidden = true
        continueButton2.isHidden = true
        timerView.isHidden = false
    }

    @objc func buttonDidTap2() {
        delegate?.didTapCancelButton()
    }
}
