//
//  DataCat.swift
//  FannyCatsSwiftUI
//
//  Created by Oleksandr Solokha on 05.10.2020.
//

import SwiftUI
import UIKit

class DataCat {
    //download CatDataBaseModel from url
    func loadCat<T: Decodable>(breedId: String) -> T {
        var data = Data()
        // url and request whit api key
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search?breed_id=" + breedId) else { fatalError("URL is not correct!") }
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
        //decoder JSON CatDataBaseModel
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(url) as \(T.self):\n\(error)")
        }
    }
}
