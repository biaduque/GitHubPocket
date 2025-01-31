//
//  HomeViewController.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 30/01/25.
//

import UIKit

/// 🇺🇸 Screen Controller that displays the list of repositories collected from the GitHub API
/// 🇧🇷 Controller da tela que apresenta a lista de repositórios coletados na API do GitHub
class HomeViewController: UIViewController {
    weak var coordinator: Coordinator?
    
    func setup(coordinator: GitHubPocketCoordinator) {
        self.coordinator = coordinator
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .red
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = .red
        
        super.viewWillAppear(true)
    }
    
    func goToDetail() {
        coordinator?.startDetail()
    }
}
