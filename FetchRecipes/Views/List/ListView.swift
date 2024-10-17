//
//  ListView.swift
//  FetchRecipes
//
//  Created by Mitch Treece on 10/16/24.
//

import SwiftUI
import SFSafeSymbols

struct ListView: View {
    
    @StateObject private var viewModel: ListViewModel
    @State private var isLoading: Bool = false
    
    init(viewModel: ListViewModel) {
        self._viewModel = viewModel.asStateObject()
    }
    
    var body: some View {
        
        List {
         
            ForEach(viewModel.recipes) { recipe in
                
                NavigationLink(value: NavRoute.detail(recipe)) {
                    RecipeView(recipe: recipe)
                }
                
            }
            
        }
        .refreshable { self.viewModel.loadData()}
        .onFirstAppear() { self.viewModel.loadData() }
        .navigationTitle("Fetch Recipes")
        .overlay {
            
            if self.isLoading {
                
                LoadingView()
                    .ignoresSafeArea()
                    .transition(.opacity)
                
            }
            else if self.viewModel.recipes.isEmpty {
                
                VStack {
                    
                    Image(systemSymbol: .forkKnife)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64, height: 64)
                        .colorMultiply(.secondary)
                    
                    Text("No Recipes")
                        .font(.headline)
                        .tint(.primary)
                    
                    Text("Try again later")
                        .font(.body)
                        .tint(.secondary)
                    
                }
                
            }
            
        }
        .onReceive(self.viewModel.$isLoading) { loading in
            withAnimation(.easeInOut(duration: 0.3)) {
                self.isLoading = loading
            }
        }
        
    }
    
}
