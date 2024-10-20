//
//  MainFeedView.swift
//  BetMeUp
//
//  Created by Songyuan Liu on 10/19/24.
//

import SwiftUI

let DummyBetCards: [BetCardView] = [
    BetCardView(creatorProfilePic: "profile3", creator: "Nathan McAlpine", betContent: "I bet Aziz is going to find a girlfriend this year", cardColor: .blue),
    BetCardView(creatorProfilePic: "profile4", creator: "Jordan Miao", betContent: "I bet Jordan can eat more than I can ", cardColor: .yellow),
    BetCardView(creatorProfilePic: "profile5", creator: "Jessica Pearson", betContent: "I bet SmartyPants is going to win this year", cardColor: .purple),
    BetCardView(creatorProfilePic: "profile2", creator: "Jessica Pearson", betContent: "I bet SmartyPants is going to win this year", cardColor: .purple),
    BetCardView(creatorProfilePic: "profile1", creator: "Jessica Pearson", betContent: "I bet SmartyPants is going to win this year", cardColor: .blue),
]

struct MainFeedView: View {
    @State private var isSheetPresented = false
    
    
    enum FeedsFilter: String {
        case recents
        case friends
        case popular
    }
    
    @State var filterChosen: FeedsFilter = .friends
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                cards
                navigationBar
                    
            }
            .sheet(isPresented: $isSheetPresented) {
                CreateBetView()
            }
        }
        .ignoresSafeArea(edges: .top)
    }
    
    var cards: some View {
        ScrollView {
            VStack(spacing: 5) {
                ForEach(DummyBetCards.indices, id: \.self) { index in
                    DummyBetCards[index]
                }
            }
        }
        .padding(.top, 120) // Push content below the navigation bar
    }
    
    var navigationBar: some View {
        VStack {
            HStack {
                NavigationLink {
                    ProfileView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Image(systemName: "gearshape.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                
                NavigationLink {
                    LeaderboardView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Image(systemName: "crown.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 40)
                        .clipShape(Circle())
                }
                Spacer()
                Text("BetMeUp")
                    .font(.title)
                    .italic()
                    .offset(x: 10)
                Spacer()
                Button(action: {
                    isSheetPresented.toggle()
                }, label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 40)
                        .clipShape(Circle())
                        .foregroundStyle(.black)
                })

                
                Image("profile1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 70)
                    .clipShape(Circle())
                    .padding(.horizontal, 5)
            }
            .cornerRadius(10)
            .padding(.horizontal)
            
            HStack {
                Text("Feeds")
                    .padding(.horizontal)
                    .font(.title)
                    .bold()
                Spacer()
                makeFilter("Recents")
                makeFilter("Friends")
                makeFilter("Popular")
            }
            .padding([.horizontal, .top])
            .offset(y: -10)
            
        }
        .foregroundStyle(.black)
        .offset(y: -20)
    }
    
    func makeFilter(_ name: String) -> some View {
        Button(action: {
            withAnimation {
                self.filterChosen = FeedsFilter(rawValue: name.lowercased())!
                // TODO: filter feed by keywords
            }
            
        }, label: {
            Text(name)
                .font(.caption)
                .bold()
                .foregroundStyle(.black)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 18)
                        .fill(self.filterChosen.rawValue == name.lowercased() ? Color(red: 0.53, green: 0.58, blue: 0.71) : Color.blue_post.backgroundColor)
                        .opacity(0.4)
                    
                )
                .animation(.easeInOut, value: "Overlay content")
        })
    }
    
}



#Preview {
    MainFeedView()
}
