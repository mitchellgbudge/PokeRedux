//
//  PokemonSearchViewController.swift
//  Pokedex
//
//  Created by Mitchell Budge on 9/6/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import UIKit

class PokemonSearchViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    var pokemonController = PokemonController()
    var pokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        pokemonController.searchForPokemon(with: searchTerm) { (_) in
            DispatchQueue.main.async {
                self.updateViews()
            }
        }
    }
    
    
    func updateViews() {
        guard let pokemon = pokemonController.pokemon else { return }
        title = pokemon.name.capitalized
    }

}
