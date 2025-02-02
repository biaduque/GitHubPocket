//
//  RepoDetailViewController.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//

import UIKit
import RxSwift

/// 🇺🇸 Screen Controller that displays the list of Pull Requests from a repository collected from the GitHub API
/// 🇧🇷 Controller da tela que apresenta a lista de Pull Requests de um repositório coletados na API do GitHub
class RepoDetailViewController: UIViewController {
    //var coordinator: Coordinator?
    var styleView: RepoDetailView?
    var router: RepoDetailRoutingProtocol?
    var interactor: RepoDetailBusinessLogic?
    
    private let disposeBag = DisposeBag()
    private let detailRequest: RepoDetailRequest
    
    // MARK: Init
    init(view: RepoDetailView, detail: RepoDetailRequest) {
        self.styleView = view
        self.detailRequest = detail
        
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
        populateView(request: detailRequest)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    // MARK: Suport functions
    func setup(router: RepoDetailRoutingProtocol) {
        self.router = router
    }
    
    func setup(interactor: RepoDetailBusinessLogic) {
        self.interactor = interactor
    }
    
    func setupController() {
        navigationController?.navigationBar.prefersLargeTitles = false 
        styleView?.setup(delegate: self)
    }
    
    // MARK: Interactor funcions
    func populateView(request: RepoDetailRequest) {
        interactor?.fetchPullRequestList({ [weak self] response in
            self?.styleView?.setup(content: response.pullRequestList ?? [],
                                   status: response.status)
        },request: detailRequest)
    }
}

extension RepoDetailViewController: RepoDetailViewDelegate {
    func backToList() {
        router?.routeBackToList()
    }
    
    func didSelectPullRequest() {
        //
    }
    
    func showError() {
        //
    }
}
