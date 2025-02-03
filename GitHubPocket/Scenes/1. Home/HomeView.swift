//
//  HomeView.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 30/01/25.
//

import UIKit
import SnapKit

protocol HomeViewDelegate: AnyObject {
    func didSelectRepository(creatorName: String, repoName: String)
}

class HomeView: UIView {
    var homeViewModel: HomeViewModel
    weak var delegate: HomeViewDelegate?
    
    lazy var contentTableView: UITableView = {
        let table = UITableView()
        table.register(RepositoryViewCell.self, forCellReuseIdentifier: RepositoryViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 100
        table.backgroundColor = .clear
        return table
    }()
    
    lazy var emptyView: EmptyListView = {
        let view = EmptyListView()
        view.backButton.isHidden = true
        view.isHidden = true
        return view
    }()
    
    lazy var loadingView: LoadingView = {
        let loading = LoadingView()
        loading.isHidden = false
        loading.start()
        return loading
    }()
    
    init(viewModel: HomeViewModel) {
        self.homeViewModel = viewModel
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }

    func setup(delegate: HomeViewDelegate) {
        self.delegate = delegate 
    }
    
    func setup(content: [RepositoryItem]) {
       homeViewModel.repoItems = content
        contentTableView.reloadData()
    }
    
    func updateContent() {
        contentTableView.reloadData()
        loadingView.stop()
        emptyView.hide()
    }
    func setupLoading() {
        loadingView.start()
    }
    
    func setupEmpty() {
        emptyView.setEmpty(cause: .emptyList)
        loadingView.stop()
    }
    
    func setupError() {
        emptyView.setEmpty(cause: .apiError)
        loadingView.stop()
    }
}

extension HomeView: BaseViewProtocol {
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
            make.height.equalTo(300)
        }
        
        emptyView.snp.makeConstraints { make in
            make.centerX.centerY.width.equalToSuperview()
            make.height.equalTo(300)
        }
    }
    
    func aditionalSetups() {
        self.backgroundColor = UIColor.backgroundPrimary
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.repoItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: RepositoryViewCell = tableView.dequeueReusableCell(withIdentifier: RepositoryViewCell.identifier, for: indexPath) as? RepositoryViewCell else { return UITableViewCell() }
        
        guard let repoItems = homeViewModel.repoItems else { return UITableViewCell() }
        if !repoItems.isEmpty {
            let item = repoItems[indexPath.row]
            cell.setupContent(repoName: item.name, description: item.description ?? "")
            cell.setupUserView(username: item.owner.username, fullname: item.fullname)
            cell.userView.setupUserImage(url: item.owner.avatarUrl)
            cell.setupView()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let repoItems = homeViewModel.repoItems else { return }
        delegate?.didSelectRepository(creatorName: repoItems[indexPath.row].owner.username,
                                      repoName: repoItems[indexPath.row].name)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = FooterView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        return footerView
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
}
