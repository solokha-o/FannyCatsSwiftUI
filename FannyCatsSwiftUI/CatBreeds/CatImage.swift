//
//  CatImage.swift
//  FannyCatsSwiftUI
//
//  Created by Oleksandr Solokha on 06.10.2020.
//

import SwiftUI

struct CatImage: View {
    //create instance LoadImage
    @State var loadImage = LoadImage()
    //init loadImage and load with get id
    init(breedId: String){
        self.loadImage.load(breedId: breedId)
    }
    //set Image if image nil or not
    var body: some View {
        Group {
            if let image = self.loadImage.downloadedImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                //set ProgressView if image nil
                ProgressView()
            }
        }
        .frame(width: 75, height: 75)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
    }
}

