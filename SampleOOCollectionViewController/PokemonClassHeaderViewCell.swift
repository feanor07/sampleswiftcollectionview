//
//  PokemonClassHeaderViewCell.swift
//  SampleOOCollectionViewController
//
//  Created by feanor07 on 15/08/16.
//  Copyright © 2016 feanor07. All rights reserved.
//

import UIKit

class PokemonClassHeaderViewCell: UICollectionReusableView {
    var index:Int!
    var pokemonCollectionController:PokemonCollectionViewController!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    // This is how we notify controller to get the section be removed
    @IBAction func deleteButtonClicked(sender: AnyObject) {
        pokemonCollectionController.deleteSection(index)
    }
}
