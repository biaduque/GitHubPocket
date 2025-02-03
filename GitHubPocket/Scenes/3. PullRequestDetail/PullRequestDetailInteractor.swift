//
//  PullRequestInteractor.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//
import UIKit

protocol PullRequestDetailBusinessLogic: AnyObject {
    func getWebView(_ completion: @escaping ((_ webViewRequest: URLRequest?)->Void), url: String)
}

class PullRequestDetailInteractor: PullRequestDetailBusinessLogic {
    func getWebView(_ completion: @escaping ((URLRequest?) -> Void), url: String) {
        guard let myURL = URL(string: url) else {
            return completion(nil)
        }
        let myRequest = URLRequest(url: myURL)
        return completion(myRequest)
    }
}
