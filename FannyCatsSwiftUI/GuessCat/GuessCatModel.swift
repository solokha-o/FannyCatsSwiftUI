//
//  GuessCatModel.swift
//  FannyCatsSwiftUI
//
//  Created by Oleksandr Solokha on 10.12.2020.
//

import Foundation
import SwiftUI

class GuessCatModel {
    
    //create 2 instance for guess cat
    var firstCat : CatBreedsDataBaseModel?
    var secondCat : CatBreedsDataBaseModel?
    //create instance for check answer
    var catForChack : CatBreedsDataBaseModel?
    var indexCatBreeds = 0
    
    //get random cat for game
    func getRandomCat(from catBreeds: [CatBreedsDataBaseModel]) -> CatBreedsDataBaseModel {
        let randomNumberOfBreed = Int.random(in: catBreeds.indices)
        return DataCatBreeds.catBreedsData[randomNumberOfBreed]
    }
    //set random cat in each answer
    func setArrayCouple() {
        var coupleCats = [CatBreedsDataBaseModel]()
        firstCat = DataCatBreeds.catBreedsData[Int.random(in: DataCatBreeds.catBreedsData.indices)]
        secondCat = DataCatBreeds.catBreedsData[Int.random(in: DataCatBreeds.catBreedsData.indices)]
        if let cat1 = firstCat, let cat2 = secondCat {
            if cat1.name == cat2.name {
                secondCat = DataCatBreeds.catBreedsData[Int.random(in: DataCatBreeds.catBreedsData.indices)]
            }
        }
        
        if let cat1 = firstCat, let cat2 = secondCat {
            coupleCats.append(cat1)
            coupleCats.append(cat2)
        }
        catForChack = coupleCats[Int.random(in: 0...1)]
    }
}
