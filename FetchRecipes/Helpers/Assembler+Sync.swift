//
//  Assembler+Sync.swift
//  FetchRecipes
//
//  Created by Mitch Treece on 10/16/24.
//

import Swinject

extension Assembler {
    
    var synchronizedResolver: Resolver {
        
        let res = self.resolver
        
        if let container = res as? Container {
            return container.synchronize()
        }
        
        return res
        
    }
    
}
