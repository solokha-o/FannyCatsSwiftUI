//
//  CatGallery.swift
//  FannyCatsSwiftUI
//
//  Created by Oleksandr Solokha on 20.10.2020.
//

import SwiftUI

struct CatGallery: View {
    
    // create spacing between GridItem
    var spacing : CGFloat = 10
    // create flexible GridItem in two columns
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    //configure collection 
    var body: some View {
        //configure size and parameters of collection
        GeometryReader { geometry in
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: gridItemLayout, spacing: spacing) {
                        ForEach(DataCatBreeds.catBreedsData) { catBreed in
                            //create and configure NavigationLink to destination CatImageDetail view
                            NavigationLink(destination: CatImageDetail(imageCat: catBreed.image)
                                            .navigationBarTitle(catBreed.name)) {
                                GalleryImage(imageCat: catBreed.image, size: (geometry.size.width - 3*spacing)/2)
                            }
                        }
                        .padding(10)
                    }
                    
                }
                .navigationBarTitle("Cat images gallery", displayMode: .automatic)
            }
        }
    }
}

struct CatGallery_Previews: PreviewProvider {
    static var previews: some View {
        CatGallery()
    }
}
