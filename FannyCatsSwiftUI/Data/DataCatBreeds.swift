//
//  DataCatBreeds.swift
//  FannyCatsSwiftUI
//
//  Created by Oleksandr Solokha on 29.09.2020.
//

import SwiftUI
import UIKit

//add url for to load cat breeds
let link = "https://api.thecatapi.com/v1/breeds"
//create array catBreedsData by CatBreedsDataBaseModel
var catBreedsData : [CatBreedsDataBaseModel] = loadData(link)
// load cat breeds from url and to decode from JSON to CatBreedsDataBaseModel
func loadData<T: Decodable>(_ link: String) -> T {
    var data = Data()
    // url and request whit api key
    guard let url = URL(string: link)
    else {
        fatalError("Codn't find url")
    }
    //get request with yourAuthorizationToken
    var reguest = URLRequest(url: url)
    let yourAuthorizationToken = "81be8538-14ea-424c-8677-0bb419c7b7ba"
    reguest.httpMethod = "GET"
    reguest.addValue(yourAuthorizationToken, forHTTPHeaderField: "x-api-key")
    //load data from url
    do {
        data = try Data(contentsOf: url)
    } catch {
        fatalError("Couldn't load - \(error)")
    }
    //decoder JSON to CatBreedsDataBaseModel
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(url) as \(T.self):\n\(error)")
    }
}
