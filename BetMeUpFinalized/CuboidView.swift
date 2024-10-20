//
//  CubeView.swift
//  BetMeUp
//
//  Created by Songyuan Liu on 10/19/24.
//

import SwiftUI
import CoreGraphics

struct CubeView: View {
    let width: Int
    let height: Int
    
    var CGWidth: CGFloat {
        CGFloat(width)
    }
    
    var CGHeight: CGFloat {
        CGFloat(height)
    }
    
    var body: some View {
        VStack {
            ZStack {
                // Fill top face with a different color
                Cuboid()
                    .fill(Color(red: 0.58, green: 0.57, blue: 0.60)) // Color for the top face
                    .frame(width: CGWidth, height: CGHeight)
                
                // Fill front face with another color
                CuboidFrontFace()
                    .fill(Color(red: 0.31, green: 0.31, blue: 0.35))
                    .frame(width: CGWidth, height: CGHeight)
            }
            .frame(minWidth: CGWidth, minHeight: CGHeight) // Ensure minimum sizes
            .fixedSize() // Prevent stretching
        }
        
    }
    
}

struct Cuboid: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // front face coordinates
        let frontBottomLeft = CGPoint(x: rect.maxX * 0.13, y: rect.maxY)
        let frontBottomRight = CGPoint(x: rect.maxX * 0.86, y: rect.maxY)
        let frontTopLeft = CGPoint(x: rect.maxX * 0.13, y: rect.maxY * 0.18)
        let frontTopRight = CGPoint(x: rect.maxX * 0.86, y: rect.maxY * 0.18)
        
        // top face coordinates
        let topBottomLeft = CGPoint(x: rect.maxX * 0.13, y: rect.maxY * 0.18)
        let topBottomRight = CGPoint(x: rect.maxX * 0.86, y: rect.maxY * 0.18)
        let topTopLeft = CGPoint(x: rect.maxX * 0.25, y: rect.maxY * 0.05)
        let topTopRight = CGPoint(x: rect.maxX * 0.75, y: rect.maxY * 0.05)
        
        // front face
        path.move(to: frontBottomLeft)
        path.addLine(to: frontBottomRight)
        path.addLine(to: frontTopRight)
        path.addLine(to: frontTopLeft)
        path.closeSubpath()
        
        // top face
        path.move(to: topBottomLeft)
        path.addLine(to: topBottomRight)
        path.addLine(to: topTopRight)
        path.addLine(to: topTopLeft)
        path.closeSubpath()
        
        return path
    }
}

struct CuboidFrontFace: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        // front face coordinates
        let frontBottomLeft = CGPoint(x: rect.maxX * 0.13, y: rect.maxY)
        let frontBottomRight = CGPoint(x: rect.maxX * 0.86, y: rect.maxY)
        let frontTopLeft = CGPoint(x: rect.maxX * 0.13, y: rect.maxY * 0.18)
        let frontTopRight = CGPoint(x: rect.maxX * 0.86, y: rect.maxY * 0.18)
        
        path.move(to: frontBottomLeft)
        path.addLine(to: frontBottomRight)
        path.addLine(to: frontTopRight)
        path.addLine(to: frontTopLeft)
        path.closeSubpath()
        
        return path
    }
}


#Preview {
    CubeView(width: 300, height: 200)
}
