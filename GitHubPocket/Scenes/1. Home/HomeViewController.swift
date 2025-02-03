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
        interactor?.fetchRepoList(page: String(page))
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
}

// MARK: Presenter functions
extension HomeViewController: ContentControllerProtocol {
    func setupContent(with list: [RepositoryItem]) {
        styleView?.setup(content: list)
    }
    
    func setupEmpty() {
        styleView?.setupEmpty()
    }
    
    func setupLoading() {
        styleView?.setupLoading()
    }
    
    func setupError() {
        styleView?.setupError()
    }
    
    func updateView() {
        styleView?.updateContent()
    }
}

// MARK: Extensions
extension HomeViewController: HomeViewDelegate {
    func didSelectRepository(creatorName: String, repoName: String) {
        router?.goToDetail(from: RepoDetailRequest(creatorName: creatorName,
                                                   repoName: repoName))
    }
    
    func didRequestedNextPage() {
        page+=1
        interactor?.fetchRepoList(page: String(page))
    }
}
