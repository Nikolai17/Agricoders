//
//  NewTemplateViewController.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 18.11.2023.
//

import UIKit
import SnapKit

class NewTemplateViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
      }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let calendarView = UICalendarView()
    let timePicker = UIDatePicker()
    let progressView = UIProgressView()

    var time: String?
    var dateComponents: DateComponents?

    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()

    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Далее", for: .normal)
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        button.backgroundColor = .agro
        button.round(with: .both, radius: 10)
        button.layer.masksToBounds = true
        button.isEnabled = false
        button.setTitleColor(.systemGray, for: .disabled)

        return button
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        title = "Выберите начало"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    func setUp() {
        progressView.setProgress(0, animated: true)
        progressView.progressTintColor = .agro
        self.timePicker.datePickerMode = .time
        timeLabel.text = "Время начала "
        view.backgroundColor = #colorLiteral(red: 0.9404773116, green: 0.940477252, blue: 0.940477252, alpha: 1)

        view.addSubview(calendarView)
        view.addSubview(continueButton)
        view.addSubview(progressView)

        let container = UIView()
        container.backgroundColor = .white
        container.round(with: .bottom, radius: 10)
        container.layer.masksToBounds = true

        container.addSubview(timePicker)
        container.addSubview(timeLabel)
        view.addSubview(container)

        timePicker.addTarget(self, action: #selector(startTimeDiveChanged), for: UIControl.Event.valueChanged)

        let gregorianCalendar = Calendar(identifier: .gregorian)
        calendarView.tintColor = .agro
        calendarView.backgroundColor = .white
        calendarView.round(with: .top, radius: 10)
        calendarView.layer.masksToBounds = true

        calendarView.calendar = gregorianCalendar
        calendarView.availableDateRange = DateInterval(start: .now, end: .distantFuture)
        let selection = UICalendarSelectionSingleDate(delegate: self)

        calendarView.selectionBehavior = selection
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .never

        progressView.snp.makeConstraints {
            $0.height.equalTo(4)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }

        calendarView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(progressView.snp.bottom).offset(24)
        }

        container.snp.makeConstraints {
            $0.top.equalTo(calendarView.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }

        timeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(16)
        }

        timePicker.snp.makeConstraints {
            $0.centerY.equalTo(timeLabel.snp.centerY).offset(-5)
            $0.trailing.equalToSuperview().inset(16)
        }

        continueButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(40)
            $0.height.equalTo(50)
        }
    }

    @objc func startTimeDiveChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        time = formatter.string(from: sender.date)
    }

    @objc func buttonDidTap() {
        let viewController = NewTemplateStep2ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARk: - UICalendarSelectionSingleDateDelegate

extension NewTemplateViewController: UICalendarSelectionSingleDateDelegate {

    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        continueButton.isEnabled = true
        self.dateComponents = dateComponents
    }
}