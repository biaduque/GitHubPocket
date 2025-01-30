//
//  UIColor.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 30/01/25.
//

import UIKit

extension UIColor {
    static var accent: UIColor {
        UIColor(named: "AccentColor") ?? .systemBlue
    }
    static var backgroundPrimary: UIColor {
        UIColor(named: "BackgroundPrimary") ?? .systemBackground
    }
    static var textPrimary: UIColor {
        UIColor(named: "Title") ?? .systemPink
    }
    static var caption: UIColor {
        UIColor(named: "Caption") ?? .systemGray
    }
    static var backgroundCell: UIColor {
        UIColor(named: "BackgroundCell") ?? .systemGray
    }
}
