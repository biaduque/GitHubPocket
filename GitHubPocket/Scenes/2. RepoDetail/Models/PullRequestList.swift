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
    var htmlUrl: String?
    var created: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case body
        case user
        case htmlUrl = "html_url"
        case created = "created_at"
    }
}

struct User: Decodable {
    var login: String
    var avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
    }
}
