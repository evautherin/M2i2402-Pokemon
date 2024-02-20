//
//  ContentView.swift
//  Pokemon
//
//  Created by Etienne Vautherin on 20/02/2024.
//

import SwiftUI

struct ContentView: View {
    let model = Model()
    
    var body: some View {
        List {
            ForEach(model.pokemonLinks) { link in
                Text(link.name)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
