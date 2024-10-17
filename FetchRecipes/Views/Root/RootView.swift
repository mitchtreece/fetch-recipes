//
//  RootView.swift
//  FetchRecipes
//
//  Created by Mitch Treece on 10/16/24.
//

import SwiftUI

struct RootView: View {
    
    @StateObject private var viewModel: RootViewModel
    
    init(viewModel: RootViewModel) {
        self._viewModel = viewModel.asStateObject()
    }
    
    var body: some View {
        
        NavigationStack {
            
            let viewModel = AppContainer
                .models
                .listView
            
            ListView(
                viewModel: viewModel
            )
            .navigationDestination(for: NavRoute.self) { route in
                route.view
            }
            
        }
        
    }
    
}
