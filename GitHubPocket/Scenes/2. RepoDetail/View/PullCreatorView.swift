//
//  PullCreatorView.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//


import UIKit
import SnapKit

class PullCreatorView: UserView {
    override init() {
        super.init()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func setupView() {
        setupHierarchy()
        setupConstraints()
    }
    
    override func setupHierarchy() {
        addSubview(userImage)
        addSubview(username)
        addSubview(name)
    }
    
    override func setupConstraints() {
        userImage.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        username.snp.makeConstraints { make in
            make.top.equalTo(userImage).inset(4)
            make.leading.equalTo(userImage.snp.trailing).offset(4)
        }
        
        name.snp.makeConstraints { make in
            make.top.equalTo(username.snp.bottom).offset(4)
            make.leading.equalTo(username).offset(4)
        }
    }
}

