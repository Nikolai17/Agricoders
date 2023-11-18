//
//  FioView.swift
//  Agricoders
//
//  Created by Nikolay Volnikov on 18.11.2023.
//

import UIKit
import SnapKit

class FioStatusView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    let fioLabel:  UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black

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

    override func draw(_ rect: CGRect) {
        addSubview(fioLabel)
        addSubview(imageView)
        addSubview(statusLabel)

        fioLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }

        statusLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
        }

        imageView.snp.makeConstraints {
            $0.trailing.equalTo(statusLabel.snp.leading).offset(-6)
            $0.size.equalTo(7)
            $0.centerY.equalTo(statusLabel.snp.centerY)
        }
    }

    func config(fio: String, status: WorkStatus) {
        fioLabel.text = fio

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


enum RoundType {
    case top
    case none
    case bottom
    case both
}

extension UIView {

    func round(with type: RoundType, radius: CGFloat = 3.0) {
        var corners: UIRectCorner

        switch type {
        case .top:
            corners = [.topLeft, .topRight]
        case .none:
            corners = []
        case .bottom:
            corners = [.bottomLeft, .bottomRight]
        case .both:
            corners = [.allCorners]
        }

        DispatchQueue.main.async {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }

}

extension UIColor {
    static let agro = #colorLiteral(red: 0.6550073028, green: 0.7082381845, blue: 0.04327847064, alpha: 1)
}
