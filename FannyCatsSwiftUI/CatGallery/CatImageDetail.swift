//
//  CatImageDetail.swift
//  FannyCatsSwiftUI
//
//  Created by Oleksandr Solokha on 11.11.2020.
//

import SwiftUI

struct CatImageDetail: View {
    // create state for show share sheet
    @State private var showShareSheet = false
    // create instance for pass cat's image to CatImageDetail view
    var imageCat : UIImage?
    
    var body: some View {
        //configure CatImageDetail view
        GeometryReader { geometry in
            VStack {
                ZStack {
                    //show image or ProgressView if image nil
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                        .stroke(Color.black, lineWidth: 2)
                        .foregroundColor(Color.white)
                    if let image = imageCat {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                    } else {
                        ProgressView()
                    }
                }
                .padding(10)
                .frame(width: geometry.size.width, height: geometry.size.width)
                Spacer()
                //configure button whit action to show share sheet
                Button(action:{
                    self.showShareSheet = true
                }) {
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                        Text("Tap to share")
                    }
                }
                .padding(10)
            }
            .sheet(isPresented: $showShareSheet, content: {
                ShareSheet(activityItems: [imageCat!])
            })
        }
    }
}


struct CatImageDetail_Previews: PreviewProvider {
    static var previews: some View {
        CatImageDetail(imageCat: catBreedsData[0].image)
    }
}
