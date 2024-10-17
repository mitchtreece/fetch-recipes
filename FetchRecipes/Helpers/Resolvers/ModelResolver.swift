//
//  ModelResolver.swift
//  FetchRecipes
//
//  Created by Mitch Treece on 10/16/24.
//

import Swinject

class ModelResolver: BaseResolver {
    
    override init() {}
    
    var rootView: RootViewModel {
        return self.resolver.resolve(RootViewModel.self)!
    }
    
    var listView: ListViewModel {
        return self.resolver.resolve(ListViewModel.self)!
    }
    
    var detailView: DetailViewModel {
        return self.resolver.resolve(DetailViewModel.self)!
    }
    
}

class ModelAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(RootViewModel.self) { r in
            return RootViewModel()
        }
        
        container.register(ListViewModel.self) { r in
            
            return ListViewModel(
                network: r.resolve(NetworkServiceProtocol.self)!
            )
            
        }
        
        container.register(DetailViewModel.self) { r in
            
            return DetailViewModel(
                network: r.resolve(NetworkServiceProtocol.self)!
            )
            
        }
        
    }
    
}
