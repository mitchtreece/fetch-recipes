//
//  ListViewModel.swift
//  FetchRecipes
//
//  Created by Mitch Treece on 10/16/24.
//

import Foundation

class ListViewModel: ViewModel {
    
    private let network: NetworkServiceProtocol
    
    @Published private(set) var isLoading = false
    @Published private(set) var recipes = [Recipe]()
        
    init(network: NetworkServiceProtocol) {
        self.network = network
    }
    
    func loadData() {
        
        Task {
            await _loadData()
        }
        
    }
    
    // MARK: Private
    
    private func _loadData() async {
        
        guard !self.isLoading else { return }
        
        await MainActor.run {
            self.isLoading = true
        }
        
        let recipes = (try? await self.network.recipes()) ?? []
        
        // Add slight delay so loading animation
        // has some time to display. In real life,
        // we wouldn't do this. But this is a quick
        // little project :)
        try! await Task.sleep(for: .seconds(2))
        ///////////////////////////////////////////
        
        await MainActor.run {
            
            self.isLoading = false
            self.recipes = recipes
            
        }
        
    }
    
}
