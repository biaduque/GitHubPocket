//
//  RepositoriesRequest.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//

import UIKit

class RepositoriesRequest {
    static func bindUrl(page: String) -> URL? {
        var urlString = "https://api.github.com/search/repositories?q=language:Kotlin&sort=stars"
       
        let urlPage = "\(urlString)&page=\(page)"
        return URL(string: urlPage)
    }
}
