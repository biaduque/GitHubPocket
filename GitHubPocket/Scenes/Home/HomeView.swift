//
//  HomeView.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 30/01/25.
//

import UIKit
import SnapKit

protocol HomeViewDelegate: AnyObject {
    func didSelectRepository()
}

class HomeView: UIView {
    weak var delegate: HomeViewDelegate?
    
    lazy var contentTableView: UITableView = {
        let table = UITableView()
        table.register(RepositoryCell.self, forCellReuseIdentifier: RepositoryCell.identifier)
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 100
        return table
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    
    
    func setup(delegate: HomeViewDelegate) {
        self.delegate = delegate 
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: RepositoryCell = tableView.dequeueReusableCell(withIdentifier: RepositoryCell.identifier, for: indexPath) as? RepositoryCell else { return UITableViewCell() } // lembrar de colocar empty view?
        
        cell.setupView()
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
