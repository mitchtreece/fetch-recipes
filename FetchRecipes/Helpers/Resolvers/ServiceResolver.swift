//
//  ServiceResolver.swift
//  FetchRecipes
//
//  Created by Mitch Treece on 10/16/24.
//

import Swinject

class ServiceResolver: BaseResolver {
    
    override init() {}
    
    var network: NetworkServiceProtocol {
        return self.resolver.resolve(NetworkServiceProtocol.self)!
    }
    
}

class ServiceAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(NetworkServiceProtocol.self) { r in
            NetworkService()
        }
        .inObjectScope(.container)
        
    }
    
}
