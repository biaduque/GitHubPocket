//
//  RepoDetailViewModel.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//

protocol RepoDetailModel {
    var status: ViewModelStatus { get set }
    var pullRequestList: [RepoDetailList]? { get set }
}

struct RepoDetailViewModel: RepoDetailModel {
    var status: ViewModelStatus = .loading
    var pullRequestList: [RepoDetailList]?
}
