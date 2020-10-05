//
//  Breeds.swift
//  FannyCatsSwiftUI
//
//  Created by Oleksandr Solokha on 05.10.2020.
//

import SwiftUI

struct Breeds: View {
    
    init() {
        UINavigationBar.appearance().barTintColor = .systemTeal
        UINavigationBar.appearance().backgroundColor = .systemTeal
    }
    
    var body: some View {
        //create NavigationView and configure it
        NavigationView {
            //create list from CatBreedsRow
            List(catBreedsData) { catBreed in
                CatBreedsRow(catBreed: catBreed)
            }
            .navigationBarTitle("Breeds")
        }
    }
}

struct Breeds_Previews: PreviewProvider {
    static var previews: some View {
        Breeds()
    }
}
