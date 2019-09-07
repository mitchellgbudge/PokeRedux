//
//  PokemonController.swift
//  Pokedex
//
//  Created by Mitchell Budge on 9/6/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import Foundation

class PokemonController {
    
    var pokemon: Pokemon?
    
    let baseURL = URL(string: "https://pokeapi.co/api/v2/pokemon/")!
    typealias CompletionHandler = (Error?) -> Void
    
    func searchForPokemon (with searchTerm: String, completion: @escaping CompletionHandler = { _ in }) {
        
        let pokemonURL = baseURL.appendingPathComponent(searchTerm.lowercased())

        URLSession.shared.dataTask(with: pokemonURL){ (data, _, error) in
            if let error = error {
                NSLog("Error getting users: \(error)")
            }
            guard let data = data else {
                NSLog("No data returned from data task.")
                completion(nil)
                return
            }
            do {
                let searchedPokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                print(searchedPokemon)
                self.pokemon = searchedPokemon
            } catch {
                NSLog("Error decoding users: \(error)")
                completion(error)
                return
            }
            completion(nil)
            }.resume()
    }
}
