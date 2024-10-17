//
//  NetworkService.swift
//  FetchRecipes
//
//  Created by Mitch Treece on 10/16/24.
//

import Spider
import Espresso

enum NetworkError: Error {
    
    case badResponse
    case decoding
    
}

class NetworkService: NetworkServiceProtocol {
    
    var serviceName: String { "Network" }
    var serviceSymbol: String { "🌎" }
    
    private let spider = Spider()
    
    func recipes() async throws -> [Recipe] {
        
        // https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json
        // https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json
        // https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json
        
        let json = try await self.spider
            .get("https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")
            .jsonThrowing()
        
        guard let jsonArray = json["recipes"] as? [JSON] else {
            throw NetworkError.badResponse
        }
        
        guard let recipes = Recipe.from(jsons: jsonArray) else {
            throw NetworkError.decoding
        }
        
        return recipes
        
    }
    
    func directions(recipe: Recipe) async throws -> Directions? {
        
        let query = recipe
            .name
            .replacingOccurrences(of: " ", with: "+")
        
        let url = "https://www.themealdb.com/api/json/v1/1/search.php?s=\(query)"
        
        let json = try await self.spider
            .get(url)
            .jsonThrowing()
        
        guard let jsonArray = json["meals"] as? [JSON],
              let mealJson = jsonArray.first,
              let mealName = mealJson["strMeal"] as? String,
              let mealInstructions = mealJson["strInstructions"] as? String else { return nil }
        
        return .init(
            recipeName: mealName,
            description: mealInstructions
        )
        
    }
    
}
