//
//  Stack.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 04/02/25.
//


import UIKit
import SnapKit

class StatsStackView: UIView {
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 2
        stack.distribution = .fillProportionally
        return stack
    }()
    
    lazy var icon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "arrow.trianglehead.pull")
        icon.tintColor = UIColor.highlight
        return icon
    }()
    
    lazy var valueLabel: UILabel = {
        let label = DSLabel.highlightedStyle
        label.text = "0"
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
}

extension StatsStackView: BaseViewProtocol {
    func setupView() {
        setupHierarchy()
        setupConstraints()
    }
    
    func setupHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(icon)
        stackView.addArrangedSubview(valueLabel)
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        icon.snp.makeConstraints { make in
            make.height.width.equalTo(25)
        }
        
        valueLabel.snp.makeConstraints { make in
            make.height.width.equalTo(25)
        }
    }
    
    func aditionalSetups() {
        
    }
}
