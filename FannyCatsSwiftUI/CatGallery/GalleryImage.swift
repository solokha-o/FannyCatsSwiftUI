//
//  GalleryImage.swift
//  FannyCatsSwiftUI
//
//  Created by Oleksandr Solokha on 20.10.2020.
//

import SwiftUI

struct GalleryImage: View {
    //create image of cat in collection
    var imageCat : UIImage?
    //set size of image
    var size : CGFloat
    
    //set Image if image nil or not
    var body: some View {
        if let image = imageCat {
            return AnyView(
                ZStack{
                    Image(uiImage: image)
                        .resizable()
                        .cornerRadius(10)
                }
                .frame(width: size, height: size)
            )
        } else {
            return AnyView(
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                        .stroke(Color.init(.systemTeal), lineWidth: 2)
                        .foregroundColor(Color.white)
                    ProgressView()
                }
                .frame(width: size, height: size)
            )
        }
    }
}

struct GalleryImage_Previews: PreviewProvider {
    static var previews: some View {
        GalleryImage(imageCat: catBreedsData[0].image, size: 100)
    }
}
