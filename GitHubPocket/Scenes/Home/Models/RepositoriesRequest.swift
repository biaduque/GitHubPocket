//
//  RepositoriesRequest.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//

import UIKit

class RepositoriesRequest {
    static func bindUrl(page: String) -> URL? {
        let urlString = "https://api.github.com/search/repositories?q=language:Swift&sort=stars"
       
        let urlPage = "\(urlString)&page=\(page)"
        return URL(string: urlPage)
    }
}
