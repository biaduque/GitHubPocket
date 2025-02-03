//
//  ViewModelStatusChanges.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 03/02/25.
//

/// Possíveis estados alterativos de uma view
protocol ViewModelStatusChanges {
    func updateContent()
    func setupLoading()
    func setupEmpty()
    func setupError()
}
