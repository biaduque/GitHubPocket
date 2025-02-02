//
//  PullRequestList.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//

struct RepoDetailList: Decodable {
    var title: String
    var body: String?
    var user: User
}

struct User: Decodable {
    var login: String
    var avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "html_url"
    }
}
