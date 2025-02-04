//
//  RepositoryCell.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//

import UIKit

class RepositoryViewCell: UITableViewCell {
    static var identifier = "RepositoryCell"
    
    lazy var repoNameLabel: UILabel = {
        let name = DSLabel.titleStyle
        name.text = "Nome do repositório"
        return name
    }()
    
    lazy var descriptionLabel: UILabel = {
        let desc = DSLabel.bodyStyle
        desc.text = "Descrição do repositório, descrição do repositório, descrição do repositório"
        return desc
    }()
    
    lazy var userView: UserView = {
        let view = UserView()
        view.setupView()
        return view
    }()
    
    lazy var repoNumbers: RepoNumbersView = {
        let view = RepoNumbersView()
        view.setupView()
        return view
    }()
    
    func setupContent(repoName: String, description: String, forks: Int, stars: Int) {
        repoNameLabel.text = repoName
        descriptionLabel.text = description
        repoNumbers.forksIcon.valueLabel.text = String(forks)
        repoNumbers.starIcon.valueLabel.text = String(stars)
    }
    
    func setupUserView(username: String, fullname: String) {
        userView.username.text = "@\(username)"
        userView.name.text = fullname
    }
}

extension RepositoryViewCell: BaseViewProtocol {
    func setupView() {
        setupHierarchy()
        setupConstraints()
        aditionalSetups()
    }
    
    func setupHierarchy() {
        addSubview(repoNameLabel)
        addSubview(descriptionLabel)
        addSubview(repoNumbers)
        addSubview(userView)
    }
    
    func setupConstraints() {
        repoNameLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(20)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(repoNameLabel.snp.bottom).offset(4)
            make.leading.equalTo(repoNameLabel)
            make.height.equalTo(30)
            make.trailing.equalTo(userView.snp.leading)
        }
        
        repoNumbers.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(4)
            make.leading.equalTo(repoNameLabel)
            make.trailing.equalTo(userView.snp.leading)
            make.bottom.equalToSuperview()
        }
        
        userView.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.top.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(8)
        }
    }
    
    func aditionalSetups() {
        selectionStyle = .none
    }
}
