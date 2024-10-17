//
//  DetailView.swift
//  FetchRecipes
//
//  Created by Mitch Treece on 10/16/24.
//

import SwiftUI
import NukeUI

struct DetailView: View {
    
    @StateObject private var viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self._viewModel = viewModel.asStateObject()
    }
    
    var body: some View {
        
        ZStack {
            
            ScrollView {
                
                // Header
                
                HeaderView(
                    recipe: self.viewModel.recipe
                )
                
                Spacer(minLength: 24)
                
                // Buttons
                
                if let _ = self.viewModel.recipe.sourceUrl {
                    
                    SimpleButtonView(title: "View Source", symbol: .globe) {
                        self.viewModel.openSource()
                    }
                    .padding(.horizontal, 24)

                }
                
                if let _ = self.viewModel.recipe.youtubeUrl {
                    
                    Spacer(minLength: 8)
                    
                    SimpleButtonView(title: "Watch on YouTube", symbol: .playRectangle, color: .red) {
                        self.viewModel.openYouTube()
                    }
                    .padding(.horizontal, 24)
                    
                }
                
                // Instructions
                
                if self.viewModel.hasLinks {
                    Spacer(minLength: 24)
                }
                
                if let directions = self.viewModel.directions {
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Text("Instructions")
                            .font(.title)

                        Text(directions.description)
                            .font(.body)
                        
                    }
                    .padding(.horizontal, 24)

                }
                
            }
            
        }
        .navigationTitle(self.viewModel.recipe.name)
        .navigationBarTitleDisplayMode(.inline)
        .onFirstAppear { self.viewModel.loadData() }
        
    }
    
}
