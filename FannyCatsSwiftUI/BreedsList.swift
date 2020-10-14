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
               //configure NavigationLink with destination to CatBreedsDetail
                NavigationLink(
                    destination: CatBreedsDetail(link: catBreed.wikipediaURL ?? "https://www.google.com.ua")
                        .navigationBarTitle(catBreed.name)) {
                    CatImage(breedId: catBreed.id)
                    Divider()
                    CatBreedsRow(catBreed: catBreed)
                }
            }
            .navigationBarTitle("Breeds", displayMode: .automatic)
        }
    }
}

struct Breeds_Previews: PreviewProvider {
    static var previews: some View {
        BreedsList()
    }
}
