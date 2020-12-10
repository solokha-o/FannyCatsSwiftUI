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
        //get link to load CatDataBaseModel
        let link = "https://api.thecatapi.com/v1/images/search?breed_id="
        //create array CatDataBaseModel and load it
        let catDataBaseModel : [CatDataBaseModel] = loadData(link + breedId)
        //get URL from CatDataBaseModel
        guard let imageURL = URL(string: catDataBaseModel[0].url) else {
                    fatalError("ImageURL is not correct!")
                }
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                     self.didChange.send(nil)
                    print("Image not load!")
                }
                return
            }
            self.downloadedImage = UIImage(data: data)
            DispatchQueue.main.async {
                self.didChange.send(self)
                print("Load image of cat breed \(catDataBaseModel[0].url)")
                //pass downloaded image to data model
                for i in catBreedsData.indices {
                    if catBreedsData[i].id == breedId {
                        catBreedsData[i].image = self.downloadedImage
                    }
                }
            }
        }.resume()
    }
}
