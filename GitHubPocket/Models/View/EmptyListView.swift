//
//  EmptyListView.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//
import UIKit
import SnapKit

class EmptyListView: UIView {
    var emptyCause: EmptyCause = .emptyList
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 4
        stack.distribution = .fillProportionally
        return stack
    }()
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "empty-list")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var message: UILabel = {
        let label = DSLabel.bodyStyle
        label.textColor = UIColor.caption
        label.numberOfLines = 4
        label.textAlignment = .center
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back to repo list", for: .normal)
        button.backgroundColor = UIColor.accent
        button.setTitleColor(UIColor.emptyState, for: .normal)
        button.layer.cornerRadius = 15
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func setEmpty(cause: EmptyCause) {
        image.image = UIImage(named: cause.image())
        message.text = cause.message()
        
        reloadInputViews()
    }
    
    public func hide() {
        self.removeFromSuperview()
    }
}

extension EmptyListView: BaseViewProtocol {
    func setupView() {
        setupHierarchy()
        setupConstraints()
    }
    func setupHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(message)
        stackView.addArrangedSubview(backButton)
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        image.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.width.equalTo(160)
        }
        
        message.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.width.equalTo(image)
        }
        
        backButton.snp.makeConstraints { make in
            make.height.equalTo(45)
            make.width.equalTo(image)
        }
    }
    
    func aditionalSetups() {
        //
    }
}
