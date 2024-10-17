//
//  NavRoute.swift
//  FetchRecipes
//
//  Created by Mitch Treece on 10/16/24.
//

import SwiftUI
import EspressoUI

enum NavRoute: Hashable {
    
    case detail(Recipe)
    
}

extension NavRoute /* View */ {
    
    var view: some View {
        
        switch self {
        case .detail(let recipe):
            
            let viewModel = AppContainer
                .models
                .detailView
                .setup(recipe: recipe)
            
            return DetailView(
                viewModel: viewModel
            )
            .asAnyView()
            
        }
        
    }
    
}
