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
            BreedsList()
                .tabItem {
                    Image("item1")
                    Text("Cat breeds")
                        .foregroundColor(Color.black)
                }
        }
        .accentColor(Color.black)
    }
}

struct TabMenu_Previews: PreviewProvider {
    static var previews: some View {
        TabMenu()
    }
}
