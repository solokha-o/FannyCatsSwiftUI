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
        if let image = self.loadImage.downloadedImage {
            return AnyView(Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10))
        } else {
            //set ProgressView if image nil
            return AnyView(ProgressView()
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10))
        }
    }
}

