//
//  NetworkServiceMock.swift
//  FetchRecipes
//
//  Created by Mitch Treece on 10/16/24.
//

import Foundation

class NetworkServiceMock: NetworkServiceProtocol {
    
    var serviceName: String { "Network (Mock)" }
    var serviceSymbol: String { "🌎" }
    
    func recipes() async throws -> [Recipe] {
        return Recipe.mocks(count: 10)
    }
    
    func directions(recipe: Recipe) async throws -> Directions? {
        return .mock()
    }
    
}
