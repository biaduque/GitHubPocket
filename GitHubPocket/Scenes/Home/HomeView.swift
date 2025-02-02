//
//  HomeView.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 30/01/25.
//

import UIKit
import SnapKit

protocol HomeModel {
    var isLoading: Bool { get set }
    var isError: Bool { get set }
    var repoItems: [RepositoryItem]? { get set }
    var totalCount: Int { get set }
}

struct HomeViewModel: HomeModel {
    var isLoading: Bool = true
    var isError: Bool = false
    var repoItems: [RepositoryItem]?
    var totalCount: Int = 0
}

protocol HomeViewDelegate: AnyObject {
    func didSelectRepository()
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
        return table
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
    
    func setup(content: [RepositoryItem], count: Int, _ isLoading: Bool?, _ isError: Bool?) {
        homeViewModel.repoItems = content
        homeViewModel.totalCount = count
        homeViewModel.isLoading = isLoading ?? true
        homeViewModel.isError = isError ?? true
        
        contentTableView.reloadData()
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
    }
    
    func setupConstraints() {
        contentTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func aditionalSetups() {
        self.backgroundColor = UIColor.backgroundPrimary
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.totalCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: RepositoryViewCell = tableView.dequeueReusableCell(withIdentifier: RepositoryViewCell.identifier, for: indexPath) as? RepositoryViewCell else { return UITableViewCell() } // lembrar de colocar empty view?
        
        guard let repoItems = homeViewModel.repoItems else { return UITableViewCell() }
        if !repoItems.isEmpty {
            let item = repoItems[indexPath.row]
            cell.setupContent(repoName: item.name, description: item.description ?? "")
            cell.setupUserView(username: item.owner.username, fullname: item.fullname)
            cell.setupView()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectRepository()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = FooterView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        return footerView
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
}
