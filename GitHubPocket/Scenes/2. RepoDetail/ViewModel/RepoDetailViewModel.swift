//
//  RepoDetailViewModel.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//

protocol RepoDetailModel {
    var pullRequestList: [RepoDetailList]? { get set }
}

struct RepoDetailViewModel: RepoDetailModel {
    var pullRequestList: [RepoDetailList]?
}
