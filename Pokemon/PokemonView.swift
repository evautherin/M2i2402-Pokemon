//
//  PokemonView.swift
//  Pokemon
//
//  Created by Etienne Vautherin on 20/02/2024.
//

import SwiftUI

struct PokemonView: View {    
    let urlString: String
    @State var pokemon: Pokemon?
    
    var body: some View {
        Group {
            if let pokemon {
                Text(pokemon.name)
            } else {
                ProgressView()
            }
        }
        .task {
            do {
                self.pokemon = try await Pokemon.getPokemon(urlString: urlString)
            } catch {
                defaultLog.error("Error: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    PokemonView(urlString: "https://pokeapi.co/api/v2/pokemon/1/")
}
