//
//  BetCardView.swift
//  BetMeUp
//
//  Created by Songyuan Liu on 10/19/24.
//

import SwiftUI

struct BetCardView: View {
    let creatorProfilePic: String
    let creator: String
    let createdTime: Int = 2
    let betContent: String
    let cardColor: PostColor
    
    var colorSet: (backgroundColor: Color, placeBetColor: Color) {
        Color.chooseColor(cardColor)
    }

    
    var body: some View {
        VStack {
            header
            betDescription
            footNote
        }
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(colorSet.backgroundColor)
        )
        .animation(.easeInOut, value: "Overlay content")
        .padding([.horizontal], 20)
        
        
    }
    
    var header: some View {
        HStack {
            Image("\(creatorProfilePic)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 100)
                .clipShape(Circle())
                .padding(.horizontal, 5)
            
            VStack(alignment: .leading) {
                Text(creator)
                    .font(.headline)
                
                Text("\(createdTime) hours ago")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
        }
        .padding(.leading, 5)
        
    }
    var betDescription: some View {
        Text(betContent)
            .lineLimit(nil)
            .padding([.horizontal, .bottom], 20)
    }
    
    var footNote: some View {
        HStack {
            Image(systemName: "eye.fill")
            Image(systemName: "heart")
            Image(systemName: "text.bubble.fill")
            
            Spacer()
            NavigationLink {
                BetDetailView()
            } label: {
                Text("Place Your Bet")
                    .font(.caption)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .fill(colorSet.placeBetColor)
                        
                    )
                    .animation(.easeInOut, value: "Overlay content")
                    .padding()
            }
        }
        .foregroundStyle(.gray)
        .padding([.horizontal])
    }
}

enum PostColor {
    case blue
    case yellow
    case purple
}

extension Color {
    static var blue_post: (backgroundColor: Color, placeBetColor: Color) {
        return (Color(red: 0.88, green: 0.92, blue: 1.00), Color(red: 0.53, green: 0.59, blue: 0.70))
    }
    
    static var yellow_post: (backgroundColor: Color, placeBetColor: Color) {
        return (Color(red: 1.00, green: 0.96, blue: 0.87), Color(red: 0.80, green: 0.68, blue: 0.38))
    }
    
    static var purple_post: (backgroundColor: Color, placeBetColor: Color) {
        return (Color(red: 0.95, green: 0.87, blue: 1.00), Color(red: 0.69, green: 0.56, blue: 0.78))
    }
    
    static func chooseColor(_ picked: PostColor) -> (backgroundColor: Color, placeBetColor: Color) {
        switch picked {
        case .blue:
            return Color.blue_post
        case .yellow:
            return Color.yellow_post
        case .purple:
            return Color.purple_post
        }
    }
}

#Preview {
    BetCardView(creatorProfilePic: "myprofile", creator: "Steven Liu", betContent: "This is a long string that will automatically wrap across multiple lines in SwiftUI when there isn't enough horizontal space.", cardColor: .blue)
}
