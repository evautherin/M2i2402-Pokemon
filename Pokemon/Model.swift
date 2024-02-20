//
//  Model.swift
//  Pokemon
//
//  Created by Etienne Vautherin on 20/02/2024.
//

import SwiftUI

@Observable
class Model {
    var pokemonLinks = [PokemonLink]()
    
    init() {
        Task {
            guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon") else {
                print("Error with URL")
                return
            }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                print("Error with request")
                return
            }
            
            let root = try JSONDecoder().decode(Root.self, from: data)
            self.pokemonLinks = root.results
        }
    }
}


struct Root: Codable {
    let results: [PokemonLink]
}

struct PokemonLink: Codable, Identifiable {
    var id: String { url }
    
    let name: String
    let url: String
}
