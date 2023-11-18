//
//  Step4Cell.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 18.11.2023.
//


import UIKit
import SnapKit

class Step6Cell: UICollectionViewCell {

    static let id = "step6Cell"

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.6606984735, green: 0.6606983542, blue: 0.6606983542, alpha: 0.8470588235)

        return label
    }()

    let descriptionLabel:  UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.3872469664, green: 0.3872469068, blue: 0.3872469068, alpha: 1)

        return label
    }()

    let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "chevron.right")
        view.tintColor = .gray
        
        return view
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
        separatorView.backgroundColor = #colorLiteral(red: 0.9404773116, green: 0.940477252, blue: 0.940477252, alpha: 1)
        backgroundColor = .clear
        contentView.addSubview(imageView)
        contentView.addSubview(separatorView)

        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.spacing = 10
        vStack.addArrangedSubview(titleLabel)
        vStack.addArrangedSubview(descriptionLabel)
        contentView.addSubview(vStack)

        vStack.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
        }

        separatorView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.bottom.equalToSuperview().inset(-10)
            $0.leading.trailing.equalToSuperview()
        }

        imageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
    }

    func configure(_ model: Step6CellModel) {
        titleLabel.text = model.titleLabel
        descriptionLabel.text = model.descriptionLabel
    }
}
