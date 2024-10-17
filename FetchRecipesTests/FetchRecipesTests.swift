//
//  FetchRecipesTests.swift
//  FetchRecipesTests
//
//  Created by Mitch Treece on 10/16/24.
//

import Testing
@testable import FetchRecipes

@Suite("App Tests")
struct FetchRecipesTests {
    
    private let networkMock: NetworkServiceProtocol
    
    init() {
        self.networkMock = NetworkServiceMock()
    }
    
    @Test("NetworkService is resolvable")
    func networkServiceIsResolvable() {
        
        let resolver = AppContainer
            .services
            .resolver
        
        let service = resolver?
            .resolve(NetworkServiceProtocol.self)
        
        #expect(service != nil)
        
    }

    @Test("NetworkService returns recipe models")
    func networkServiceReturnsRecipeModels() async throws {
        
        let recipes = try await self
            .networkMock
            .recipes()
        
        #expect(recipes.count > 0)
        
    }

}
