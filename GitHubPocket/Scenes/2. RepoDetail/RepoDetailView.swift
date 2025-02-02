//
//  RepoDetailView.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//

import UIKit

protocol RepoDetailViewDelegate: AnyObject {
    func didSelectPullRequest()
    func showError()
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
    
    func setup(content: [RepoDetailList], status: ViewModelStatus) {
        repoDetailModel.status = status
        switch status {
        case .loading:
            setupLoading()
        case .error:
            showError()
        case .success:
            repoDetailModel.pullRequestList = content
            contentTableView.reloadData()
        case .empty:
            showEmpty()
        }
    }
    
    func setupLoading() {
        
    }
    
    func showError() {
        
    }
    
    func showEmpty() {
        emptyView.isHidden = false
    }
    
    @objc func didSelectBack() {
        delegate?.backToList()
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
        addSubview(emptyView)
    }
    
    func setupConstraints() {
        contentTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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
        guard let cell: PullRequestViewCell = tableView.dequeueReusableCell(withIdentifier: PullRequestViewCell.identifier, for: indexPath) as? PullRequestViewCell else { return UITableViewCell() } // lembrar de colocar empty view?
        
        guard let repoItems = repoDetailModel.pullRequestList else { return UITableViewCell() }
        if !repoItems.isEmpty {
            let item = repoItems[indexPath.row]
            cell.setupContent(pullRequestName: item.title,
                              description: item.body ?? "No description provided")
            cell.setupUserView(username: item.user.login,
                               fullname: item.user.login)
            cell.setupView()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectPullRequest()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = FooterView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        return footerView
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
}
