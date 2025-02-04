//
//  URLSessionMock.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 03/02/25.
//

import UIKit

class URLSessionMock: URLSession {
    var data: Data?
    var error: Error?

    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let task = URLSessionDataTaskMock()
        task.completionHandler = { [weak self] in
            completionHandler(self?.data, nil, self?.error)
        }
        return task
    }
}

class URLSessionDataTaskMock: URLSessionDataTask {
    var completionHandler: (() -> Void)?

    override func resume() {
        completionHandler?()
    }
}
