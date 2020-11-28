//
//  TabMenu.swift
//  FannyCatsSwiftUI
//
//  Created by Oleksandr Solokha on 05.10.2020.
//

import SwiftUI
import UIKit

struct TabMenu: View {
    
    init() {
        UITabBar.appearance().barTintColor = .systemTeal
    }
    
    var body: some View {
        //create TabView and configure it
        TabView {
            //configure 1-st item "Cat Breeds"
            BreedsList().tabItem {
                VStack {
                    Image("item1")
                    Text("Cat breeds")
                        .foregroundColor(Color.black)
                }
            }
            //Configure 2-nd item "Guess Cat"
            GuessCat().tabItem {
                VStack {
                    Image("item2")
                    Text("Guess cat")
                        .foregroundColor(Color.black)
                }
            }
            //Configure 3-rd item "Cat Gallery"
            CatGallery().tabItem {
                VStack {
                    Image("item3")
                    Text("Cat Gallery")
                        .foregroundColor(Color.black)
                }
            }
        }
    }
}

struct TabMenu_Previews: PreviewProvider {
    static var previews: some View {
        TabMenu()
    }
}
