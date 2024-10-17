//
//  Directions.swift
//  FetchRecipes
//
//  Created by Mitch Treece on 10/16/24.
//

import Espresso

struct Directions: Codable {
    
    let recipeName: String
    let description: String
    
}

extension Directions: Mockable {
    
    static func mock() -> Directions {
        
        return .init(
            recipeName: Recipe.mock().name,
            description: "Mock directions."
        )
        
    }
    
}
