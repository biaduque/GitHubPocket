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

struct HomeViewModel: HomeModel {
    var repoItems: [RepositoryItem]?
    var totalCount: Int = 0
}
