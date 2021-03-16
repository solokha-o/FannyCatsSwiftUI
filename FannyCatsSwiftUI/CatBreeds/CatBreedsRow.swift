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
    var catBreed: CatBreedsDataBaseModel
    
    var body: some View {
        //configure 2 text in vertical stack
        VStack(alignment: .leading) {
            Text(catBreed.name)
            Text("Country of Origin - " + catBreed.origin)
                .font(.caption)
        }
    }
}

struct CatBreedsRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CatBreedsRow(catBreed: DataCatBreeds.catBreedsData[0])
            CatBreedsRow(catBreed: DataCatBreeds.catBreedsData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
