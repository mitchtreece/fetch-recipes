//
//  FetchApp.swift
//  FetchRecipes
//
//  Created by Mitch Treece on 10/16/24.
//

import SwiftUI
import Swinject

@main
struct FetchApp: App {
    
    init() {
                
        let assembler = Assembler([
            ServiceAssembly(),
            ModelAssembly()
        ])
        
        AppContainer.setup(
            resolver: assembler.synchronizedResolver
        )
        
    }
    
    var body: some Scene {
        
        WindowGroup {
            
            let viewModel = AppContainer
                .models
                .rootView
            
            RootView(viewModel: viewModel)
                        
        }
        
    }
    
}
