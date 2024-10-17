//
//  HeaderView.swift
//  FetchRecipes
//
//  Created by Mitch Treece on 10/16/24.
//

import SwiftUI
import NukeUI

struct HeaderView: View {
    
    private let recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var body: some View {
        
        ZStack {
            
            LazyImage(url: self.recipe.photoUrl) { state in
                
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
            .frame(height: 200)
            .clipped()

            LinearGradient(
                gradient: .init(colors: [.black, .clear]),
                startPoint: .bottom,
                endPoint: .top
            )
            .opacity(0.8)
            
            VStack(alignment: .leading) {
                
                Spacer()
                
                Text(self.recipe.category)
                    .font(.title2)
                    .foregroundStyle(.white.opacity(0.7))
                
                Text(self.recipe.name)
                    .font(.title)
                    .foregroundStyle(.white)
                     
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
        }
        
    }
    
}
