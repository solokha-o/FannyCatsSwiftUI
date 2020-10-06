//
//  Breeds.swift
//  FannyCatsSwiftUI
//
//  Created by Oleksandr Solokha on 05.10.2020.
//

import SwiftUI

struct BreedsList: View {
    
    init() {
        UINavigationBar.appearance().barTintColor = .systemTeal
        UINavigationBar.appearance().backgroundColor = .systemTeal
    }
    
    var body: some View {
        //create NavigationView and configure it
        NavigationView {
            //create list from CatBreedsRow and add image from CatImage
            List(catBreedsData) { catBreed in
                CatImage(breedId: catBreed.id)
                CatBreedsRow(catBreed: catBreed)
            }
            .navigationBarTitle("Breeds")
        }
    }
}

struct Breeds_Previews: PreviewProvider {
    static var previews: some View {
        BreedsList()
    }
}
