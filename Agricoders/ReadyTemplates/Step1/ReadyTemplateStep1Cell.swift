//
//  ReadyTemplateStep1Cell.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 18.11.2023.
//


import UIKit
import SnapKit

class ReadyTemplateStep1Cell: UICollectionViewCell {

    static let id = "readyTemplateStep1Cell"

    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)

        return label
    }()

    let descriptionLabel:  UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = #colorLiteral(red: 0.3872469664, green: 0.3872469068, blue: 0.3872469068, alpha: 1)

        return label
    }()

    let titleSizeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)

        return label
    }()

    let descriptionSizeLabel:  UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = #colorLiteral(red: 0.3872469664, green: 0.3872469068, blue: 0.3872469068, alpha: 1)

        return label
    }()

    let separatorView = UIView()

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
        separatorView.backgroundColor = .lightGray
        backgroundColor = .clear
        contentView.addSubview(separatorView)

        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.spacing = 10
        vStack.addArrangedSubview(titleLabel)
        vStack.addArrangedSubview(descriptionLabel)
        contentView.addSubview(vStack)

        let vStack2 = UIStackView()
        vStack2.axis = .vertical
        vStack2.spacing = 10
        vStack2.addArrangedSubview(titleSizeLabel)
        vStack2.addArrangedSubview(descriptionSizeLabel)
        contentView.addSubview(vStack2)

        vStack.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
        }

        vStack2.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview()
        }

        separatorView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.bottom.equalToSuperview().inset(-10)
            $0.leading.trailing.equalToSuperview()
        }
    }

    func configure(_ model: ReadyTemplateStep1Model) {
        titleLabel.text = model.titleLabel
        descriptionLabel.text = model.descriptionLabel
        titleSizeLabel.text = model.titleSizeLabel
        descriptionSizeLabel.text = model.descriptionSizeLabel
    }
}
