//
//  CatImage.swift
//  FannyCatsSwiftUI
//
//  Created by Oleksandr Solokha on 06.10.2020.
//

import SwiftUI

struct CatImage: View {
    //create instance LoadImage
    var loadImage = LoadImage()
    // create instance Image
    var placeholder: Image
    //init loadImage and load with get id and init placeholder from image file "item1"
    init(breedId: String, placeholder: Image = Image("item1")){
        self.placeholder = placeholder
        self.loadImage.load(breedId: breedId)
    }
    //set Image if image nil or not
    var body: some View {
        if let image = self.loadImage.downloadedImage {
            return Image(uiImage: image)
        } else {
            return placeholder
        }
    }
}

