//
//  RepositoryCell.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//

import UIKit

class RepositoryCell: UITableViewCell {
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
}

extension RepositoryCell: BaseViewProtocol {
    func setupView() {
        setupHierarchy()
        setupConstraints()
        aditionalSetups()
    }
    
    func setupHierarchy() {
        addSubview(repoNameLabel)
        addSubview(descriptionLabel)
        addSubview(userView)
    }
    
    func setupConstraints() {
        repoNameLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(20)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(repoNameLabel.snp.bottom).offset(4)
            make.leading.equalTo(repoNameLabel)
            make.trailing.equalTo(userView.snp.leading)
        }
        
        userView.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.top.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(8)
        }
    }
    
    func aditionalSetups() {
        selectionStyle = .none
    }
}
