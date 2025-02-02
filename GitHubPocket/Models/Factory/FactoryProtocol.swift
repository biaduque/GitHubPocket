//
//  FactoryProtocol.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//
import UIKit

protocol FactoryProtocol: AnyObject {
    static func makeController(with coordinator: GitHubPocketCoordinator) -> UIViewController
}
