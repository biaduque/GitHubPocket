//
//  RepoDetailView.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//

import UIKit

protocol RepoDetailViewDelegate: AnyObject {
    func didSelectPullRequest(url: String)
    func backToList()
}

class RepoDetailView: UIView {
    var repoDetailModel: RepoDetailModel
    weak var delegate: RepoDetailViewDelegate?
    
    lazy var contentTableView: UITableView = {
        let table = UITableView()
        table.register(PullRequestViewCell.self, forCellReuseIdentifier: PullRequestViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 120
        return table
    }()
    
    lazy var emptyView: EmptyListView = {
        let view = EmptyListView()
        view.backButton.addTarget(self, action: #selector(didSelectBack), for: .touchUpInside)
        view.isHidden = true
        return view
    }()
    
    lazy var loadingView: LoadingView = {
        let loading = LoadingView()
        loading.isHidden = false
        loading.start()
        return loading
    }()
    
    init(viewModel: RepoDetailModel) {
        self.repoDetailModel = viewModel
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }

    func setup(delegate: RepoDetailViewDelegate) {
        self.delegate = delegate
    }
    
    func setup(content: [RepoDetailList]) {
        repoDetailModel.pullRequestList = content
        
        emptyView.hide()
        loadingView.stop()
    }
    
    @objc func didSelectBack() {
        delegate?.backToList()
    }
}

extension RepoDetailView: ViewModelStatusChanges {
    func updateContent() {
        contentTableView.reloadData()
        reloadInputViews()
    }
    
    func setupLoading() {
        loadingView.start()
    }
    
    func setupEmpty() {
        emptyView.isHidden = false
        emptyView.setEmpty(cause: .emptyList)
        loadingView.stop()
    }
    
    func setupError() {
        emptyView.isHidden = false
        emptyView.setEmpty(cause: .apiError)
        loadingView.stop()
    }
}

extension RepoDetailView: BaseViewProtocol {
    func setupView() {
        setupHierarchy()
        setupConstraints()
        aditionalSetups()
    }
    
    func setupHierarchy() {
        addSubview(contentTableView)
        addSubview(loadingView)
        addSubview(emptyView)
    }
    
    func setupConstraints() {
        contentTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        loadingView.snp.makeConstraints { make in
            make.centerX.centerY.width.equalToSuperview()
            make.height.equalTo(500)
        }
        
        emptyView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(300)
        }
    }
    
    func aditionalSetups() {
        self.backgroundColor = UIColor.backgroundPrimary
    }
}

extension RepoDetailView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repoDetailModel.pullRequestList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: PullRequestViewCell = tableView.dequeueReusableCell(withIdentifier: PullRequestViewCell.identifier, for: indexPath) as? PullRequestViewCell else { return UITableViewCell() }
        
        guard let repoItems = repoDetailModel.pullRequestList else { return UITableViewCell() }
        if !repoItems.isEmpty {
            let item = repoItems[indexPath.row]
            cell.setupContent(pullRequestName: item.title,
                              description: item.body ?? "No description provided")
            cell.setupUserView(username: item.user.login,
                               fullname: item.user.login)
            cell.userView.setupUserImage(url: item.user.avatarUrl)
            cell.setupView()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let repoItems = repoDetailModel.pullRequestList else { return }
        let item = repoItems[indexPath.row]
        
        delegate?.didSelectPullRequest(url: item.htmlUrl ?? "")
    }
}
