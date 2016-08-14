//
//  PokemonCollectionViewController.swift
//  SampleOOCollectionViewController
//
//  Created by feanor07 on 15/08/16.
//  Copyright © 2016 feanor07. All rights reserved.
//

import UIKit

private let reuseIdentifier = "pokemoncell"
private let headerIdentifier = "pokemonclasscell"

class PokemonCollectionViewController: UICollectionViewController {
    
    private var pokemonClasses:[PokemonClass] = [PokemonClass]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let fireClass = createPokemonClass("Fire Type", color: UIColor.orangeColor())
        let waterClass = createPokemonClass("Water Type", color: UIColor.cyanColor())
        let electricClass = createPokemonClass("Electric Type", color: UIColor.yellowColor())
        
        pokemonClasses+=[fireClass,waterClass,electricClass]
        
        addPokemonToClass(fireClass, pokemonNames: ["Charizard", "Ninetales", "Arcanine", "Rapidash", "Magmar", "Flareon"])
        addPokemonToClass(waterClass, pokemonNames: ["Blastoise", "Golduck", "Cloyster", "Goldeen", "Magikarp", "Vaporeon"])
        addPokemonToClass(electricClass, pokemonNames: ["Pikachu", "Magneton", "Zapdos", "Electrabuzz", "Raichu", "Jolteon"])
    }
    
    // This is the removal of the related section! Be aware of the last line for redrawing of the collection view!
    func deleteSection(index:Int) {
        pokemonClasses.removeAtIndex(index)
        self.collectionView?.reloadData()
    }
    
    private func createPokemonClass(name:String, color:UIColor)->PokemonClass {
        return PokemonClass(name:name, color:color);
    }
    
    private func addPokemonToClass(pokemonClass:PokemonClass, pokemonNames:[String]) {
        
        for index in 0 ..< pokemonNames.count {
            let pokemon = Pokemon(name:pokemonNames[index])
            pokemonClass.addPokemon(pokemon)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return pokemonClasses.count
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonClasses[section].getPokemonCount()
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! PokemonCollectionViewCell
    
        let pokemon = pokemonClasses[indexPath.section].getPokemonAtIndex(indexPath.row)
        cell.name.text = pokemon.name
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: headerIdentifier, forIndexPath: indexPath) as! PokemonClassHeaderViewCell
        let index = indexPath.section
        headerView.titleLabel.text = pokemonClasses[index].name
        headerView.backgroundColor = pokemonClasses[index].color
        // We are passing section index and the controller to header view cell in order to be notified from the button click!
        headerView.index = index
        headerView.pokemonCollectionController = self
        
        return headerView
    }

}
