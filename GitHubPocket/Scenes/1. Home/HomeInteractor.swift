//
//  HomeInteractor.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 30/01/25.
//

import RxSwift
import UIKit

///
/// O interactor está sendo responsável por consumir a peça que realizar a consulta direta na API no caso, o WORKER.
/// Responsável por invocar a **HomePresenter**, que por sua vez, invoca os casos de apresentação de view
/// que serão disponibilizadas para o usuário de acordo com cada estado: vazio, erro, carregando ou sucesso
protocol HomeBusinessLogic {
    func fetchRepoList(page: String)
}

class HomeInteractor: HomeBusinessLogic {
    private let disposeBag = DisposeBag()
    
    var worker: HomeWorkingProtocol?
    var presenter: HomePresentationLogic?
    
    func setup(worker: HomeWorkingProtocol, presenter: HomePresentationLogic) {
        self.worker = worker
        self.presenter = presenter
    }
    
    func fetchRepoList(page: String) {
        presenter?.presentLoading()
        
        worker?.getRepoList(page: page)
            .subscribe(
                onNext: { [weak self] repoListResponse in
                    guard let self = self else { return }
                    
                    if repoListResponse.items.isEmpty {
                        presenter?.presentEmptyView()
                    }
                    presenter?.presentRepoList(content: repoListResponse.items)
                    
                },
                onError: { [weak self] error in
                    guard let self = self else { return }
                    presenter?.presentError()
                    
                },
                onCompleted: {
                    self.presenter?.updateView()
                }
            )
            .disposed(by: disposeBag)
    }
}
