//
//  RepoNumberView.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 04/02/25.
//


import UIKit
import SnapKit

class RepoNumbersView: UIView {
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 2
        stack.distribution = .fillProportionally
        return stack
    }()
    
    lazy var forksIcon: StatsStackView = {
        let icon = StatsStackView()
        icon.icon.image = UIImage(systemName: "arrow.trianglehead.pull")
        icon.setupView()
        return icon
    }()
    
    lazy var starIcon: StatsStackView = {
        let icon = StatsStackView()
        icon.icon.image = UIImage(systemName: "star.fill")
        icon.setupView()
        return icon
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
}

extension RepoNumbersView: BaseViewProtocol {
    func setupView() {
        setupHierarchy()
        setupConstraints()
    }
    
    func setupHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(forksIcon)
        stackView.addArrangedSubview(starIcon)
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        forksIcon.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(80)
        }
        
        starIcon.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(80)
        }
    }
    
    func aditionalSetups() {
        
    }
}
