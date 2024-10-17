//
//  RecipeView.swift
//  FetchRecipes
//
//  Created by Mitch Treece on 10/16/24.
//

import SwiftUI
import NukeUI

struct RecipeView: View {
    
    private let recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var body: some View {
        
        HStack {
            
            ZStack {
                
                Color
                    .secondary
                    .opacity(0.2)
                
                LazyImage(url: recipe.photoUrl) { state in
                
                    if let image = state.image {
                        
                        image
                            .resizable()
                            .scaledToFill()
                        
                    }
                    else if state.error != nil {
                        
                        Image(systemSymbol: .photo)
                            .font(.title)
                            .foregroundStyle(.white)
                        
                    }
                    else {
                        
                        ProgressView()
                            .tint(.black)
                        
                    }
                    
                }
                .frame(width: 64, height: 64)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                
            }
            .frame(width: 64, height: 64)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            VStack(alignment: .leading) {
                
                Text(self.recipe.name)
                    .font(.headline)
                
                Text(self.recipe.category)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
            }
            
        }
        
    }
    
}
