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
                ForEach(DataCatBreeds.catBreedsData.filter({ switch searchText.isEmpty {
                case false:
                    return $0.name.lowercased().contains(searchText.lowercased()) || $0.origin.lowercased().contains(searchText.lowercased())
                default:
                    return true
                }
                })) { catBreed in
                    //configure NavigationLink with destination to CatBreedsDetail
                    NavigationLink(
                        destination: CatBreedsDetail(link: catBreed.wikipediaURL ?? "https://www.google.com.ua").navigationTitle(catBreed.name)) {
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
