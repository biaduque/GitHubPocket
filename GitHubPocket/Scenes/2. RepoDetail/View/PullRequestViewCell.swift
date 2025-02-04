//
//  PullRequestViewCell.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//


import UIKit

class PullRequestViewCell: UITableViewCell {
    static var identifier = "PullRequestCell"
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 4
        stack.distribution = .fillProportionally
        return stack
    }()
    
    lazy var pullRequestNameLabel: UILabel = {
        let name = DSLabel.titleStyle
        name.text = "Nome do Pull Request"
        return name
    }()
    
    lazy var descriptionLabel: UILabel = {
        let desc = DSLabel.bodyStyle
        desc.text = "Descrição do pull request"
        return desc
    }()
    
    lazy var userView: PullCreatorView = {
        let view = PullCreatorView()
        view.setupView()
        return view
    }()
    
    lazy var dateLabel: UILabel = {
        let desc = DSLabel.captionStyle
        desc.text = "04/02/2025"
        return desc
    }()
    
    func setupContent(pullRequestName: String, description: String, date: String) {
        pullRequestNameLabel.text = pullRequestName
        formatDescription(with: description)
        dateLabel.text = date.setupDate()
    }
    
    func setupUserView(username: String, fullname: String) {
        userView.username.text = "@\(username)"
        userView.name.text = fullname
    }
    
    func formatDescription(with receivedDescription: String) {
        descriptionLabel.text = receivedDescription
        descriptionLabel.attributedText = receivedDescription.formatMarkdown()
        descriptionLabel.textColor = UIColor.body
    }
}

extension PullRequestViewCell: BaseViewProtocol {
    func setupView() {
        setupHierarchy()
        setupConstraints()
        aditionalSetups()
    }
    
    func setupHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(pullRequestNameLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(userView)
        stackView.addArrangedSubview(dateLabel)
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview().inset(4)
            make.top.equalToSuperview().inset(12)
            make.leading.equalToSuperview().offset(20)
        }
        
        pullRequestNameLabel.snp.makeConstraints { make in
            make.height.equalTo(15)
            make.width.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalToSuperview()
        }
        
        userView.snp.makeConstraints { make in
            make.height.equalTo(80)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
        }
    }
    
    func aditionalSetups() {
        selectionStyle = .none
    }
}
