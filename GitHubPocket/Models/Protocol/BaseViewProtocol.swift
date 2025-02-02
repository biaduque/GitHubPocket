//
//  BaseView.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//
import UIKit

/// Protocolo de configuração de views criado para que todo componente de view o herde
/// Criado em OBJC (objective-c) para que as funções possam ser sobrescritas (*override*)
@objc protocol BaseViewProtocol {
    @objc func setupHierarchy()
    @objc func setupConstraints()
    @objc func setupView()
    @objc func aditionalSetups()
}
