//
//  PokemonClass.swift
//  SampleOOCollectionViewController
//
//  Created by feanor07 on 15/08/16.
//  Copyright © 2016 feanor07. All rights reserved.
//

import UIKit

class PokemonClass {
    var name:String
    var color:UIColor
    var pokemons = [Pokemon]()
    
    init(name:String, color:UIColor) {
        self.name = name
        self.color = color
    }
    
    func addPokemon(pokemon: Pokemon) {
        pokemons+=[pokemon]
    }
    
    func getPokemonCount()->Int {
        return self.pokemons.count
    }
    
    func getPokemonAtIndex(index:Int)->Pokemon {
        return pokemons[index]
    }
}