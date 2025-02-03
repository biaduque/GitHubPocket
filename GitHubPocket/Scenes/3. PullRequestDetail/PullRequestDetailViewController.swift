//
//  PullRequestDetailViewController.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//

import UIKit
import WebKit

class PullRequestDetailViewController: UIViewController, WKUIDelegate {
    var webView: PullRequestDetailView
    var interactor: PullRequestDetailBusinessLogic?
    var webViewUrl: String
    
    init(webView: PullRequestDetailView, url: String) {
        self.webView = webView
        self.webViewUrl = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: Life Cycle
    override func loadView() {
        webView.webView.uiDelegate = self
        webView.webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebView()
    }
    
    func setup(interactor: PullRequestDetailBusinessLogic) {
        self.interactor = interactor
    }
    
    // MARK: Interactor Functions
    func loadWebView() {
        interactor?.getWebView({ [weak self] webViewRequest in
            guard let webViewRequested = webViewRequest else { return }
            self?.webView.webView.load(webViewRequested)
        }, url: webViewUrl)
    }
}
extension PullRequestDetailViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.webView.hideLoading()
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.webView.hideLoading()
    }
}
