//
//  BaseResolver.swift
//  FetchRecipes
//
//  Created by Mitch Treece on 10/16/24.
//

import Swinject

class BaseResolver {
 
    private(set) var resolver: Resolver!
        
    @discardableResult
    func setup(resolver: Resolver) -> Self {
        
        self.resolver = resolver
        return self
        
    }
    
}
