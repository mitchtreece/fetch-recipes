//
//  Recipe.swift
//  FetchRecipes
//
//  Created by Mitch Treece on 10/16/24.
//

import Espresso

struct Recipe: Identifiable, Hashable, Codable {
    
    let id: String
    let name: String
    let category: String
    let sourceUrl: URL?
    let youtubeUrl: URL?
    let photoUrl: URL?
    
    private enum CodingKeys: String, CodingKey {
        
        case id = "uuid"
        case name
        case category = "cuisine"
        case sourceUrl = "source_url"
        case youtubeUrl = "youtube_url"
        case photoUrl = "photo_url_large"
        
    }
    
}

extension Recipe: Mockable {
    
    static func mock() -> Recipe {
        
        return .init(
            id: UUID().uuidString,
            name: "Mock Recipe",
            category: "Mock Category",
            sourceUrl: URL(string: "https://google.com"),
            youtubeUrl: URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ"),
            photoUrl: URL(string: "https://m.media-amazon.com/images/M/MV5BZTU4ZjE2ZTgtYzQ5Mi00ZjQ2LTg5YzItNzEzYzE3ODliY2ZiXkEyXkFqcGc@._V1_QL75_UX480_.jpg")
        )
        
    }
    
}
