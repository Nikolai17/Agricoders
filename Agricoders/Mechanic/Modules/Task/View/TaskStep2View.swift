//
//  TaskView.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 18.11.2023.
//

import UIKit
import SnapKit
//
//protocol TaskViewDelegate: AnyObject {
//    func didTapContinueButton()
//    func didTapCancelButton()
//}

class TaskStep2View: UIView {

//    weak var delegate: TaskViewDelegate?
    var timer: Timer?

    func startTimer() {

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { [weak self] timer in
            print("timer.fireDate \(timer.fireDate)")
            DispatchQueue.main.async {
                self?.updateTimeLabel()
            }
        }
    }


    @objc func eventWith(timer: Timer!) {
        let info = timer.userInfo as Any
        print(info)
    }

    let workLabel:  UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 34)

        return label
    }()

    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Закончить", for: .normal)
        button.addTarget(self, action: #selector(buttonDidTap1), for: .touchUpInside)
        button.backgroundColor = .black
        button.round(with: .both, radius: 10)
//        button.layer.masksToBounds = true
        button.setTitleColor(.systemGray, for: .disabled)

        return button
    }()

    private lazy var continueButton2: UIButton = {
        let button = UIButton()
        button.setTitle("Пауза", for: .normal)
        button.setTitleColor(.agro, for: .normal)
        button.addTarget(self, action: #selector(buttonDidTap2), for: .touchUpInside)
        button.backgroundColor = .clear
        button.round(with: .both, radius: 10)
//        button.layer.masksToBounds = true
        button.setTitleColor(.systemGray, for: .disabled)

        return button
    }()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        configUI()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        configUI()
        startTimer()
    }

    func updateTimeLabel() {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .none
//        dateFormatter.timeStyle = .full
//        let formattedDate = dateFormatter.string(from: timer?.fireDate ?? Date())
//        print("formattedDate = \(formattedDate)")
        workLabel.text = "02:54:00"
    }

    func configUI() {
        addSubview(workLabel)

        let stack = UIStackView()
        stack.axis = .horizontal
        backgroundColor = .white
        stack.addArrangedSubview(continueButton)
        stack.addArrangedSubview(continueButton2)
        stack.distribution = .fillProportionally
        addSubview(stack)

        workLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
        }

        stack.snp.makeConstraints {
            $0.top.equalTo(workLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
    }

//    func config(_ model: TaskStep1Model) {
//        workLabel.text = model.work
//        workSizeLabel.text = model.workSize
//        carLabel.text = model.car
//        carParametrLabel.text = model.carParametr
//    }

    @objc func buttonDidTap1() {
        timer?.invalidate()
//        delegate?.didTapContinueButton()
    }

    @objc func buttonDidTap2() {
        timer?.fire()
//        timer.
//        delegate?.didTapCancelButton()
    }
}
