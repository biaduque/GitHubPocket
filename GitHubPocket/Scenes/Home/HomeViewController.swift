//
//  HomeViewController.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 30/01/25.
//

import UIKit

/// 🇺🇸 Screen Controller that displays the list of repositories collected from the GitHub API
/// 🇧🇷 Controller da tela que apresenta a lista de repositórios coletados na API do GitHub
class HomeViewController: UIViewController {
    //var coordinator: Coordinator?
    var styleView: HomeView?
    var router: HomeRoutingProtocol?
    
    // MARK: LifeCycle
    override func loadView() {
        view = styleView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupController()
    }
    
    init(view: HomeView) {
        styleView = view
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewWillAppear(_ animated: Bool) {        
        super.viewWillAppear(true)
    }
    
    // MARK: Suport functions
    func setup(router: HomeRoutingProtocol) {
        self.router = router
    }
        
    func setupController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        styleView?.setup(delegate: self)
    }
    
    // MARK: Router functions
    func routeToDetail() {
        router?.goToDetail()
    }
}

extension HomeViewController: HomeViewDelegate {
    func didSelectRepository() {
        routeToDetail()
    }
}
