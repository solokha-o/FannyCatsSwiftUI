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
    
    init() {
        UITabBar.appearance().barTintColor = .systemTeal
    }
    
    var body: some View {
        //create TabView and configure it
        TabView {
            //configure 1-st item "Cat Breeds"
            BreedsList()
                .onAppear {
                    self.tabItem1.toggle()
                    self.tabItem2.toggle()
                }
                .tabItem {
                    VStack {
                        Image(self.tabItem1 ? "item1-1" : "item1")
                        Text("Cat breeds")
                            .foregroundColor(Color.black)
                    }
                    .animation(.interpolatingSpring(mass: 0.7, stiffness: 200, damping: 10, initialVelocity: 4))
                    
                }
        //Configure 2-nd item "Guess Cat"
            GuessCat()
                .onAppear {
                    self.tabItem1.toggle()
                    self.tabItem2.toggle()
                }
                .tabItem {
                    VStack {
                        Image(self.tabItem2 ? "item2-1" : "item2")
                        Text("Guess cat")
                            .foregroundColor(Color.black)
                    }
                    .animation(.interpolatingSpring(mass: 0.7, stiffness: 200, damping: 10, initialVelocity: 4))
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

// Animating font size
struct AnimatableSFImage: AnimatableModifier {
    var size: CGFloat
    
    var animatableData: CGFloat {
        get { size }
        set { size = newValue }
    }
    
    func body(content: Self.Content) -> some View {
        content
            .font(.system(size: size))
    }
}

// helper extension
extension Image {
    func animatingSF(size: CGFloat) -> some View {
        self.modifier(AnimatableSFImage(size: size))
    }
}
