//
//  DetailViewModel.swift
//  FetchRecipes
//
//  Created by Mitch Treece on 10/16/24.
//

import UIKit

class DetailViewModel: ViewModel {
    
    private let network: NetworkServiceProtocol
    
    @Published private(set) var directions: Directions?
    
    private(set) var recipe: Recipe!
    
    var hasLinks: Bool {
        return self.recipe.sourceUrl != nil || self.recipe.youtubeUrl != nil
    }
    
    init(network: NetworkServiceProtocol) {
        self.network = network
    }
    
    @discardableResult
    func setup(recipe: Recipe) -> Self {
        
        self.recipe = recipe
        return self
        
    }
    
    func loadData() {
        
        Task {
            await _loadData()
        }
        
    }
    
    func openSource() {
        
        guard let url = self.recipe.sourceUrl else {
            return
        }
        
        openUrl(url)
        
    }
    
    func openYouTube() {
        
        guard let url = self.recipe.youtubeUrl else {
            return
        }
        
        openUrl(url)
        
    }
    
    // MARK: Private
    
    private func _loadData() async {
        
        let directions = try? await self
            .network
            .directions(recipe: self.recipe)
        
        await MainActor.run {
            self.directions = directions
        }
        
    }
    
    private func openUrl(_ url: URL) {
        
        let app = UIApplication.shared
        
        guard app.canOpenURL(url) else {
            return
        }
        
        app.open(url)
        
    }
    
}
