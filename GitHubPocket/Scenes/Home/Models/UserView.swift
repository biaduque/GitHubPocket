//
//  UserView.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//
 
import UIKit
import SnapKit

class UserView: UIView {
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 4
        stack.distribution = .fillProportionally
        return stack
    }()
    
    lazy var userImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "empty-user-image")
        image.layer.cornerRadius = 20
        image.contentMode = .scaleAspectFit
        image.backgroundColor = UIColor.emptyState
        return image
    }()
    
    lazy var username: UILabel = {
        let label = DSLabel.bodyStyle
        label.textColor = UIColor.title
        label.text = "@username"
        return label
    }()
    
    lazy var name: UILabel = {
        var label = DSLabel.captionStyle
        label.text = "Nome e sobrenome"
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

extension UserView: BaseViewProtocol {
    func setupView() {
        setupHierarchy()
        setupConstraints()
    }
    
    func setupHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(userImage)
        stackView.addArrangedSubview(username)
        stackView.addArrangedSubview(name)
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        username.snp.makeConstraints { make in
            make.height.equalTo(15)
        }
        name.snp.makeConstraints { make in
            make.height.equalTo(15)
        }
        userImage.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.centerX.equalToSuperview()
        }
    }
    
    func aditionalSetups() {
        
    }
}
