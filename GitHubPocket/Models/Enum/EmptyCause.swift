//
//  EmptyCause.swift
//  GitHubPocket
//
//  Created by Beatriz Duque on 02/02/25.
//

/// Utilizado para mensagens de erro ao usuário
///**case emptyList** ::: quando a lista é recebida vazia
///**case apiError**::: quando a lista está vazia por algum erro de API retornado
enum EmptyCause {
    case emptyList
    case apiError
    
    func message() -> String {
        switch self {
        case .emptyList:
            return "Oh, it looks like there is no pull request list for this repository.How about looking for another one?"
        case .apiError:
            return "Oh, something went wrong. Try again later."
        }
    }
    
    func image() -> String {
        switch self {
        case .emptyList:
            return "empty-list"
        case .apiError:
            return "empty-error"
        }
    }
}
