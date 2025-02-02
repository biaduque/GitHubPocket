//
//  RepositoryItem.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//

/// Documentação da API: https://docs.github.com/en/rest/search?apiVersion=2022-11-28#search-repositories

struct RepositoriesList: Decodable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [RepositoryItem]
    
    enum CodingKeys: String,CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

struct RepositoryItem: Decodable {
    let id: Int
    let name: String
    let fullname: String
    let owner: Owner
    let url: String
    let description: String?
    let stars: Int
    let language: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullname = "full_name"
        case owner
        case url = "html_url"
        case description
        case stars = "stargazers_count"
        case language
    }
}

struct Owner: Decodable {
    let username: String
    let avatarUrl: String
    
    enum CodingKeys: String,CodingKey {
        case username = "login"
        case avatarUrl = "avatar_url"
    }
}

