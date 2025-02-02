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
/// O @escaping é utilizado na função **FetchRepoList**  porque possibilita a criação do objeto da  viewModel de forma que fique pronto para popular a view, dessa forma, não é necessário  poluir a viewController com os cenários de erro, já que eles já estão sendo tratados aqui.
/// Criando o objeto que irá para a controller (no caso, **HomeViewModel**) a controller só fica responsável por passar esse objeto à diante para a view.
///
///

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

    func fetchRepoList(_ completion: @escaping ((_ repositoriesList: HomeViewModel?)->Void), page: String) {
        worker?.getRepoList(page: page)
            .subscribe(
                onNext: { [weak self] repoListResponse in
                    guard let self = self else { return }
                    self.responseModel.repoItems = repoListResponse.items
                    self.responseModel.totalCount = repoListResponse.totalCount
                    self.responseModel.status = .success
                    
                    completion(self.responseModel)
                },
                onError: { [weak self] error in
                    guard let self = self else { return }
                    self.responseModel.totalCount = 0
                    self.responseModel.status = .error
                    
                    completion(self.responseModel)
                },
                onCompleted: {
                    completion(self.responseModel)
                }
            )
            .disposed(by: disposeBag)
    }
}
