//
//  Breeds.swift
//  FannyCatsSwiftUI
//
//  Created by Oleksandr Solokha on 05.10.2020.
//

import SwiftUI

struct BreedsList: View {
    //add searchText for use SearchBarView
    @State var searchText: String = ""
    
    var body: some View {
        //create NavigationView and configure it
        NavigationView {
            //create list from CatBreedsRow and add image from CatImage and configure filter from catBreedsData in searchText
            List {
                SearchBarView(text: $searchText)
                ForEach(catBreedsData.filter({searchText.isEmpty ? true : $0.name.contains(searchText)})) { catBreed in
                    //configure NavigationLink with destination to CatBreedsDetail
                    NavigationLink(
                        destination: CatBreedsDetail(link: catBreed.wikipediaURL ?? "https://www.google.com.ua")
                            .navigationBarTitle(catBreed.name)) {
                        CatImage(breedId: catBreed.id)
                            .padding(.trailing)
                        CatBreedsRow(catBreed: catBreed)
                    }
                }
            }
            .navigationBarTitle("Breeds", displayMode: .automatic)
            .onAppear() {
                UINavigationBar.appearance().barTintColor = .systemTeal
                UINavigationBar.appearance().backgroundColor = .systemTeal
            }
        }
    }
}

struct Breeds_Previews: PreviewProvider {
    static var previews: some View {
        BreedsList()
    }
}
