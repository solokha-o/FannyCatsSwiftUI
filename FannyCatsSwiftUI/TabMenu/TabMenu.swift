//
//  TabMenu.swift
//  FannyCatsSwiftUI
//
//  Created by Oleksandr Solokha on 05.10.2020.
//

import SwiftUI
import UIKit

struct TabMenu: View {
    //create instance index of showing view, position of Shape, array of Tab Menu view
    @State var index = 0
    @State var curvePos : CGFloat = 0
    @State var tabMenuViews: [AnyView] = [AnyView(BreedsList()), AnyView(GuessCat()), AnyView(CatGallery())]
    //configure main body
    var body: some View {
        //transition when chosen current view
        ForEach(tabMenuViews.indices) { indexView in
            if indexView == index {
                tabMenuViews[indexView]
                    .transition(AnyTransition.opacity.combined(with: .move(edge: .leading)))
            }
        }
        Spacer(minLength: 15)
        //configure tab menu from buttons and with animation
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            HStack{
                GeometryReader{ g in
                    VStack{
                        Button(action: {
                            withAnimation(.spring()){
                                index = 0
                                self.curvePos = g.frame(in: .global).midX
                            }
                        }, label: {
                            Image("item1")
                                .renderingMode(.template)
                                .resizable()
                                .foregroundColor(index == 0 ? .black : .gray)
                                .frame(width: 20, height: 20)
                                .padding(.all, 10)
                                // animating View...
                                .background(Color.init(.systemTeal).opacity(index == 0 ? 1 : 0).clipShape(Circle()))
                                .offset(y: index == 0 ? -5 : 0)
                        })
                        Text("Cat Breeds")
                            .font(.caption)
                            .padding(.bottom)
                    }
                    .frame(width: 100, height: 43)
                    .onAppear {
                        self.curvePos = g.frame(in: .global).midX
                    }
                }
                .frame(width: 100, height: 43)
                Spacer(minLength: 0)
                GeometryReader{ g in
                    VStack{
                        Button(action: {
                            withAnimation(.spring()){
                                index = 1
                                self.curvePos = g.frame(in: .global).midX
                            }
                        }, label: {
                            Image("item2")
                                .renderingMode(.template)
                                .resizable()
                                .foregroundColor(index == 1 ? .black : .gray)
                                .frame(width: 20, height: 20)
                                .padding(.all, 10)
                                .background(Color.init(.systemTeal).opacity(index == 1 ? 1 : 0).clipShape(Circle()))
                                .offset(y: index == 1 ? -5 : 0)
                        })
                        Text("Guess cat")
                            .font(.caption)
                            .padding(.bottom)
                    }
                    .frame(width: 100, height: 43)
                }
                .frame(width: 100, height: 43)
                Spacer(minLength: 0)
                GeometryReader{ g in
                    VStack{
                        Button(action: {
                            withAnimation(.spring()){
                                index = 2
                                self.curvePos = g.frame(in: .global).midX
                            }
                        }, label: {
                            Image("item3")
                                .renderingMode(.template)
                                .resizable()
                                .foregroundColor(index == 2 ? .black : .gray)
                                .frame(width: 20, height: 20)
                                .padding(.all, 10)
                                .background(Color.init(.systemTeal).opacity(index == 2 ? 1 : 0).clipShape(Circle()))
                                .offset(y: index == 2 ? -5 : 0)
                        })
                        Text("Cats gallery")
                            .font(.caption)
                            .padding(.bottom)
                    }
                    .frame(width: 100, height: 43)
                }
                .frame(width: 100, height: 43)
            }
            .padding(.horizontal, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 25 : 35)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 8 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            .padding(.top, 8)
            .background(Color.init(.systemTeal).clipShape(CShape(curvePos: curvePos)))
        })
    }
}

struct TabMenu_Previews: PreviewProvider {
    static var previews: some View {
        TabMenu()
    }
}


