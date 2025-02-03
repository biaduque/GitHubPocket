//
//  HomeViewController.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 30/01/25.
//

import UIKit
import RxSwift

/// 🇺🇸 Screen Controller that displays the list of repositories collected from the GitHub API
/// 🇧🇷 Controller da tela que apresenta a lista de repositórios coletados na API do GitHub
class HomeViewController: UIViewController {
    //var coordinator: Coordinator?
    var styleView: HomeView?
    var router: HomeRoutingProtocol?
    var interactor: HomeBusinessLogic?
    
    private let disposeBag = DisposeBag()
    private var page: Int = 1
    
    // MARK: Init
    init(view: HomeView) {
        styleView = view
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: LifeCycle
    override func loadView() {
        view = styleView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupController()
        populateView(page: String(self.page))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: Suport functions
    func setup(router: HomeRoutingProtocol) {
        self.router = router
    }
    
    func setup(interactor: HomeBusinessLogic) {
        self.interactor = interactor
    }
    
    func setupController() {
        styleView?.setup(delegate: self)
    }
    
    // MARK: Interactor funcions
    func populateView(page: String) {
        interactor?.fetchRepoList({ [weak self] response in
            self?.styleView?.setup(content: response?.repoItems ?? [],
                                   count: response?.totalCount ?? 0,
                                   status: response?.status ?? .loading)
        },page: page)
    }
}

extension HomeViewController: HomeViewDelegate {
    func didSelectRepository(creatorName: String, repoName: String) {
        
        router?.goToDetail(from: RepoDetailRequest(creatorName: creatorName,
                                                   repoName: repoName))
    }
    
    func showError() {
        //
    }
}
