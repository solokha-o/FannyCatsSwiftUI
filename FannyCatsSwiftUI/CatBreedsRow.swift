//
//  CatBreedsRow.swift
//  FannyCatsSwiftUI
//
//  Created by Oleksandr Solokha on 29.09.2020.
//

import SwiftUI


//configure row
struct CatBreedsRow: View {
    // create instance of CatBreedsDataBaseModel
    var catBreeds: CatBreedsDataBaseModel
    
    var body: some View {
        //configure image and text in horizontal stack and 2 text in vertical stack
        HStack {
            VStack(alignment: .leading) {
                Text(catBreeds.name)
                Text("Country of Origin - " + catBreeds.origin)
                    .font(.caption)
            }
        }
    }
}

struct CatBreedsRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CatBreedsRow(catBreeds: catBreedsData[0])
            CatBreedsRow(catBreeds: catBreedsData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
