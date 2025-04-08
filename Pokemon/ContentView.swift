//
//  ContentView.swift
//  Pokemon
//
//  Created by Etienne Vautherin on 20/02/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(Model.self) var model

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(model.pokemonLinks) { link in
                    NavigationLink(destination: {
                        PokemonView(urlString: link.url)
                    }, label: {
                        Text(link.name)
                    })
                }
            }
            .navigationTitle("Pokemons")
            .padding()
        } detail: {
            Text("Please select a row")
        }
    }
}


#Preview {
    ContentView().environment(Model())
}
