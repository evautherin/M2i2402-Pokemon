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
    
    static func getPokemon(urlString: String) async throws -> Pokemon? {
        guard let url = URL(string: urlString) else {
            defaultLog.error("Error with URL")
            return nil
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            defaultLog.error("Error with request")
            return nil
        }
        
        return try JSONDecoder().decode(Pokemon.self, from: data)
    }
}
