//
//  FannyCatsWidgetView.swift
//  FannyCatsSwiftUI
//
//  Created by Oleksandr Solokha on 10.12.2020.
//

import SwiftUI

struct FannyCatsWidgetView: View {
    // create instance of CatBreedsDataBaseModel
    var catBreed: CatBreedsDataBaseModel
    //configure view of widget
    var body: some View {
        VStack {
            Text("Breed: \(catBreed.name)")
            CatImage(breedId: catBreed.id)
        }
    }
}

struct FannyCatsWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        FannyCatsWidgetView(catBreed: catBreedsData[0])
    }
}
