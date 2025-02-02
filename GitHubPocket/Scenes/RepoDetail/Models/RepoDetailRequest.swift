//
//  RepoDetailRequest.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//

import UIKit

class RepoDetailRequest {
    var creatorName: String
    var repoName: String
    
    init(creatorName: String, repoName: String) {
        self.creatorName = creatorName
        self.repoName = repoName
    }
    
    static func bindUrl(infos: RepoDetailRequest) -> URL? {
        let urlString = "https://api.github.com/repos/\(infos.creatorName)/\(infos.repoName)/pulls"
       
        return URL(string: urlString)
    }
}
