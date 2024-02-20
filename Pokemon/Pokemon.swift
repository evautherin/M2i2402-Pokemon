//
//  Pokemon.swift
//  Pokemon
//
//  Created by Etienne Vautherin on 20/02/2024.
//

import SwiftUI

@Observable
class Pokemon: Codable {
    let id: Int
    let name: String
    
    enum PokemonError: Error {
        case url
        case request
    }
    
    static func getPokemon(urlString: String) async throws -> Pokemon {
        guard let url = URL(string: urlString) else { throw PokemonError.url }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw PokemonError.request }
        
        let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
        return pokemon
    }
}
