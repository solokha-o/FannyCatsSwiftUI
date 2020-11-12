//
//  TabMenu.swift
//  FannyCatsSwiftUI
//
//  Created by Oleksandr Solokha on 05.10.2020.
//

import SwiftUI
import UIKit

struct TabMenu: View {
    // state for to animate item's image from small to large
    @State var tabItem1 = false
    @State var tabItem2 = true
    @State var tabItem3 = true
    
    init() {
        UITabBar.appearance().barTintColor = .systemTeal
    }
    
    var body: some View {
        //create TabView and configure it
        TabView {
            //configure 1-st item "Cat Breeds"
            BreedsList().tabItem {
                VStack {
                    Image(self.tabItem1 ? "item1-1" : "item1")
                        .animation(.interpolatingSpring(mass: 0.7, stiffness: 200, damping: 10, initialVelocity: 4))
                    Text("Cat breeds")
                        .foregroundColor(Color.black)
                }
            }
            .onAppear() {
                tabItem1 = true
                tabItem2 = false
                tabItem3 = false
            }
            .transition(.slide)
            .animation(.default)
            //Configure 2-nd item "Guess Cat"
            GuessCat().tabItem {
                VStack {
                    Image(self.tabItem2 ? "item2-1" : "item2")
                        .animation(.interpolatingSpring(mass: 0.7, stiffness: 200, damping: 10, initialVelocity: 4))
                    Text("Guess cat")
                        .foregroundColor(Color.black)
                }
            }
            .onAppear() {
                tabItem1 = false
                tabItem2 = true
                tabItem3 = false
            }
            .transition(.slide)
            .animation(.default)
            //Configure 3-rd item "Cat Gallery"
            CatGallery().tabItem {
                VStack {
                    Image(self.tabItem3 ? "item3-1" : "item3")
                        .animation(.interpolatingSpring(mass: 0.7, stiffness: 200, damping: 10, initialVelocity: 4))
                    Text("Cat Gallery")
                        .foregroundColor(Color.black)
                }
            }
            .onAppear() {
                tabItem1 = false
                tabItem2 = false
                tabItem3 = true
            }
            
            .animation(.default)
        }
        .accentColor(Color.black)
    }
}

struct TabMenu_Previews: PreviewProvider {
    static var previews: some View {
        TabMenu()
    }
}
