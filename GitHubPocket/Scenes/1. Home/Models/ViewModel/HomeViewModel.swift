//
//  HomeViewModel.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//

protocol HomeModel {
    var repoItems: [RepositoryItem]? { get set }
    var totalCount: Int { get set }
}

//// lembrar de remover
enum ViewModelStatus {
    case loading
    case error
    case success
    case empty
}

struct HomeViewModel: HomeModel {
    var repoItems: [RepositoryItem]?
    var totalCount: Int = 0
}
