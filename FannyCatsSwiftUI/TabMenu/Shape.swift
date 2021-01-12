//
//  Shape.swift
//  FannyCatsSwiftUI
//
//  Created by Oleksandr Solokha on 12.01.2021.
//

import Foundation
import SwiftUI


struct CShape : Shape {
   //create instance position of Shape and data for animation
    var curvePos : CGFloat
    var animatableData: CGFloat{
        get{return curvePos}
        set{curvePos = newValue}
    }
    // configure to draw the shape
    func path(in rect: CGRect) -> Path {
        return Path{path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.move(to: CGPoint(x: curvePos + 40, y: 0))
            path.addQuadCurve(to: CGPoint(x: curvePos - 40, y: 0), control: CGPoint(x: curvePos, y: 70))
        }
    }
}
