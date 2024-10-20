//
//  LeaderboardView.swift
//  BetMeUp
//
//  Created by Songyuan Liu on 10/19/24.
//

import SwiftUI
// UserDefaults is the api to store all information locally
let randomNames = [
    "Emily Johnson",
    "Michael Smith",
    "Olivia Brown",
    "Daniel Williams",
    "Sophia Davis",
    "James Miller",
    "Isabella Garcia",
    "Ethan Wilson",
    "Ava Anderson",
    "Benjamin Martinez",
    "Lily Taylor",
    "Lucas Thomas",
    "Mia White",
    "Alexander Harris",
    "Charlotte Clark",
    "Henry Lewis",
    "Amelia Robinson",
    "Noah Walker",
    "Grace Young",
    "Sebastian King"
]

struct LeaderboardView: View {
    @Environment(\.presentationMode) var presentationMode // For custom back button action
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    firstThree
                    Spacer()
                    RoundedRectangle(cornerRadius: 40)
                        .fill(.regularMaterial) // Base color (you can change this to any color)
                        .frame(width: 390, height: 500) // Adjust height as needed for your layout
                        .overlay(
                            ScrollView {
                                VStack {
                                    // Scrollable entries on top of the static background
                                    ForEach(randomNames.indices) { index in
                                        HStack {
                                            Text("\(index)")
                                            Image(systemName: "person.crop.circle.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 60, height: 100)
                                                .clipShape(Circle())
                                                .padding(.trailing, 30)
                                                .offset(x: 25)
                                                .foregroundStyle(.gray)
                                            VStack {
                                                Text(randomNames[index])
                                                    .padding(.bottom, 2)
                                                Text("\(Int.random(in: 1...60)) pts")
                                            }
                                            .padding(.leading)
                                        }
                                        .padding(.bottom)
                                        Divider()
                                    }
                                }
                            }
                                .frame(width: 300)
                                 // Ensure the scroll view stays within the bounds of the background
                        )

                    
                }
            }
            .background(
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray.opacity(0.8)]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                }
                    .ignoresSafeArea()
            )
            .navigationTitle("Leaderboard")
            .navigationBarTitleDisplayMode(.inline)

            .toolbar {
                // Custom Back Button
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss() // Custom back action
                    }) {
                        HStack {
                            Image(systemName: "chevron.left") // Customize with any icon
                            Text("Back") // Customize with any text
                        }
                        .foregroundColor(.black) // Customize the color
                    }
                }
            }
        }
        
    }
    
    var firstThree: some View {
        HStack(alignment: .bottom) { // Changed to HStack
            VStack {
                ZStack {
                    Image("profile1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 100)
                        .clipShape(Circle())
                        .offset(x: 25)
                    BadgeBackground()
                        .frame(width: 30)
                        .overlay(Text("2"))
                        .offset(x: 50, y: -20)
                }

                Text("300 pts")
                    .offset(x: 25)
                CubeView(width: 100, height: 120)
                    .fixedSize()
                    .offset(x:30)
            }
            
            VStack {
                ZStack {
                    Image("profile2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 100)
                        .clipShape(Circle())
                        .padding(.horizontal, 5)
                        .offset(y: 10)
                    BadgeBackground()
                        .frame(width: 30)
                        .overlay(Text("1"))
                        .offset(x: 20, y: -10)
                }
                
                Text("300 pts")
                    .offset(x: 0)
                CubeView(width: 100, height: 150)
                    .fixedSize()
            }
            
            VStack {
                ZStack {
                    Image("profile3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 100)
                        .clipShape(Circle())
                        .padding(.horizontal, 5)
                        .offset(x: -30)
                    BadgeBackground()
                        .frame(width: 30)
                        .overlay(Text("3"))
                        .offset(x: -5, y: -20)
                }
               
                    
                Text("300 pts")
                    .offset(x: -30)
                CubeView(width: 100, height: 80)
                    .fixedSize()
                    .offset(x: -30)
            }
             
            
        }
        .offset(y: 8)
    }
    
    var rankEntry: some View {
        HStack {
            Text("1")
            Image("profile4")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 100)
                .clipShape(Circle())
                .padding(.horizontal, 30)
                .offset(x: 25)
            VStack {
                Text("Steven Liu")
                Text("50 pts")
            }
        }
        .padding()
    }
}

#Preview {
    LeaderboardView()
}
