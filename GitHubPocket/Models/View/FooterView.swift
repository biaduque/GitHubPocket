//
//  FooterView.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//

import UIKit

class FooterView: UIView {
    lazy var footerLabel: UILabel = {
        let label = DSLabel.captionStyle
        label.text = "Developed by Bia Duque :)"
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
}
extension FooterView: BaseViewProtocol {
    func setupView() {
        setupHierarchy()
        setupConstraints()
    }
    
    func setupHierarchy() {
        addSubview(footerLabel)
    }
    
    func setupConstraints() {
        footerLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    func aditionalSetups() {
        //
    }
}
