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
    
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    //configure collection 
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(columns: gridItemLayout, spacing: spacing) {
                    ForEach(catBreedsData) { catBreed in
                        GalleryImage(imageCat: catBreed.image, size: (geometry.size.width - 3*spacing)/2)
                    }
                }
            }
        }
    }
}

struct CatGallery_Previews: PreviewProvider {
    static var previews: some View {
        CatGallery()
    }
}
