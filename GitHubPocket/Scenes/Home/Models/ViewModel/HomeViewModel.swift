//
//  HomeViewModel.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//

protocol HomeModel {
    var status: ViewModelStatus { get set }
    var repoItems: [RepositoryItem]? { get set }
    var totalCount: Int { get set }
}

enum ViewModelStatus {
    case loading
    case error
    case success
    case empty
}

struct HomeViewModel: HomeModel {
    var status: ViewModelStatus = .loading
    var repoItems: [RepositoryItem]?
    var totalCount: Int = 0
}
