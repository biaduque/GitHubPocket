//
//  +NSAttributedString.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//
import UIKit

/// Extension criada para conseguir exibir algumas descrições de pullRequests que possuem markdown. Sem essa tratativa, a descrição não pode ser exibida em uma label.text simples

extension String {
    func formatMarkdown() -> NSMutableAttributedString? {
        guard let data = self.data(using: .utf8) else { return nil }
        
        if let formattedString = try? NSMutableAttributedString(data: data,
                                                         options:  [.documentType: NSAttributedString.DocumentType.html],
                                                         documentAttributes: nil){
            formattedString.addAttributes(
                [.font: UIFont.systemFont(ofSize: 12)],
                range: NSRange(location: 0, length: formattedString.length)
            )
            return formattedString
        }
        return nil
    }
}
