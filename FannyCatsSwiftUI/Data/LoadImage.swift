//
//  LoadImage.swift
//  FannyCatsSwiftUI
//
//  Created by Oleksandr Solokha on 06.10.2020.
//

import Foundation
import SwiftUI
import Combine

class LoadImage {
    //create UIImage
    var downloadedImage: UIImage?
    //create instance for check if downloadedImage was change
    let didChange = PassthroughSubject<LoadImage?, Never>()
    //load image if get url from catDataBaseModel url
    func load(breedId: String) {
        //create instance DataCat
        let dataCat = DataCat()
        //create array CatDataBaseModel and load it
        let catDataBaseModel : [CatDataBaseModel] = dataCat.loadCat(breedId: breedId)
        //get URL from CatDataBaseModel
        guard let imageURL = URL(string: catDataBaseModel[0].url) else {
                    fatalError("ImageURL is not correct!")
                }
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                     self.didChange.send(nil)
                }
                return
            }
            self.downloadedImage = UIImage(data: data)
            DispatchQueue.main.async {
                self.didChange.send(self)
            }
        }.resume()
    }
}
