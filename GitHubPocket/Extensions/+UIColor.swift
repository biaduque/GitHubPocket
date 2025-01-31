//
//  UIColor.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 30/01/25.
//

import UIKit

extension UIColor {
    static var accentColor: UIColor {
        UIColor(named: "AccentColor") ?? .systemBlue
    }
    static var background: UIColor {
        UIColor(named: "BackgroundPrimary") ?? .systemBackground
    }
    static var primaryText: UIColor {
        UIColor(named: "Title") ?? .systemPink
    }
    static var calloutText: UIColor {
        UIColor(named: "Caption") ?? .systemGray
    }
    static var bodyText: UIColor {
        UIColor(named: "Body") ?? .systemGray
    }
    static var highlightText: UIColor {
        UIColor(named: "Highlight") ?? .systemGray
    }
}
