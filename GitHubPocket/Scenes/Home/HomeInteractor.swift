//
//  HomeInteractor.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 30/01/25.
//

import RxSwift
import UIKit

protocol HomeBusinessLogic {
    func fetchRepoList(_ completion: @escaping ((_ repositoriesList: HomeViewModel?)->Void), page: String)
}

class HomeInteractor: HomeBusinessLogic {
    var worker: HomeWorkingProtocol?
    private let disposeBag = DisposeBag()
    
    var responseModel: HomeViewModel = HomeViewModel()
    
    func setup(worker: HomeWorkingProtocol) {
        self.worker = worker
    }

    /// **FetchRepoList**
    /// Aqui o interactor esta sendo responsável por consumir a peça que realizar a consulta direta no GIT, no caso, o WORKER.
    /// Gosto de utilizar o @escaping dentro da interactor porque assim consigo criar o objeto da viewModel de forma que ja fique pronto para popular a view, dessa forma, não preciso poluir a viewController com os cenários de erro, já que eles já estão sendo tratados aqui.
    /// Dessa forma, criando o objeto que irá para a controller (no caso, **HomeViewModel**) a controller só fica responsável por passar esse objeto à diante para a view.
    func fetchRepoList(_ completion: @escaping ((_ repositoriesList: HomeViewModel?)->Void), page: String) {
        worker?.getRepoList(page: page)
            .subscribe(
                onNext: { [weak self] repoListResponse in
                    guard let self = self else { return }
                    self.responseModel.repoItems = repoListResponse.items
                    self.responseModel.totalCount = repoListResponse.totalCount
                    
                    completion(self.responseModel)
                },
                onError: { [weak self] error in
                    guard let self = self else { return }
                    self.responseModel.totalCount = 0
                    self.responseModel.isLoading = false
                    self.responseModel.totalCount = 0
                    
                    completion(self.responseModel)
                },
                onCompleted: {
                    self.responseModel.isLoading = false
                    
                    completion(self.responseModel)
                }
            )
            .disposed(by: disposeBag)
    }
}
