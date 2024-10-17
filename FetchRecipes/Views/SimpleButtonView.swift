//
//  SimpleButtonView.swift
//  FetchRecipes
//
//  Created by Mitch Treece on 10/16/24.
//

import SwiftUI
import SFSafeSymbols

struct SimpleButtonView: View {
    
    private let title: String
    private let symbol: SFSymbol?
    private let color: Color
    private let action: ()->()
    
    init(title: String,
         symbol: SFSymbol? = nil,
         color: Color = .black,
         action: @escaping ()->()) {
        
        self.title = title
        self.symbol = symbol
        self.color = color
        self.action = action
        
    }
    
    var body: some View {
        
        Button {
            
            action()
            
        } label: {
            
            Label(
                self.title,
                systemSymbol: self.symbol
            )
            .frame(maxWidth: .infinity)
            
        }
        .buttonStyle(.borderedProminent)
        .tint(self.color)
        .controlSize(.large)
        
    }
    
}
