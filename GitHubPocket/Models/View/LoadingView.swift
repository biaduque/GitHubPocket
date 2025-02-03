//
//  PullRequestDetailLoading.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//
import UIKit

class LoadingView: UIView {
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 4
        stack.distribution = .fillProportionally
        return stack
    }()
    
    lazy var spinner: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        loading.tintColor = UIColor.accent
        loading.hidesWhenStopped = true 
        return loading
    }()
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "loading-content")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var message: UILabel = {
        let label = DSLabel.bodyStyle
        label.textColor = UIColor.caption
        label.textAlignment = .center
        label.text = "Loading content..."
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    public func start() {
        spinner.startAnimating()
    }
    
    public func stop() {
        spinner.stopAnimating()
        message.isHidden = true
        image.isHidden = true
    }
}

extension LoadingView: BaseViewProtocol {
    func setupView() {
        setupHierarchy()
        setupConstraints()
    }
    
    func setupHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(spinner)
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(message)
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        spinner.snp.makeConstraints { make in
            make.height.width.equalTo(50)
        }
        image.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.width.equalTo(160)
        }
        message.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
    }
    
    func aditionalSetups() {
        backgroundColor = .purple
    }
}
