//
//  NetworkServiceProtocol.swift
//  FetchRecipes
//
//  Created by Mitch Treece on 10/16/24.
//

import Foundation

protocol NetworkServiceProtocol: ServiceProtocol {
    
    func recipes() async throws -> [Recipe]
    func directions(recipe: Recipe) async throws -> Directions?
    
}
