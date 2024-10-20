//
//  ContentView.swift
//  BetMeUp
//
//  Created by Songyuan Liu on 10/19/24.
//


import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode // For custom back button action
    @State private var balance: Double = 100.0
    
    var body: some View {
        NavigationView {
            VStack {
                // Top Profile Section
                VStack {
                    // Profile picture
                    Image("profile1") // Replace with your profile image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 110, height: 110)
                        .clipShape(Circle())
                        .padding(.top, 50)
                        .offset(y: -10)
                    
                    // Username
                    Text("Steven Liu")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    // Handle
                    Text("@stevenliubetyouras")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.bottom, 40)
                
                // Menu Items
                
                VStack(alignment: .center, spacing: 30) {
                    NavigationButton(iconName: "newspaper.fill", text: "Balances", hasNotification: false, notificationCount: 3)
                    NavigationButton(iconName: "newspaper.fill", text: "Your Bets", hasNotification: false, notificationCount: 3)
                    NavigationButton(iconName: "x.circle.fill", text: "Sign Out", hasNotification: false, notificationCount: 3)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 50)
                
                
                Spacer()
                
                
            }
            .background(
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray.opacity(0.8)]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.ultraThickMaterial)
                        .frame(width: 300, height: 500)
                }
                    .ignoresSafeArea()
            )
            .shadow(radius: 30)
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
}

// Custom navigation button component
struct NavigationButton: View {
    let iconName: String
    let text: String
    let hasNotification: Bool
    let notificationCount: Int?
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .font(.title2)
                .foregroundColor(.black)
            
            Text(text)
                .font(.title3)
                .foregroundColor(.black)
            
            Spacer()
            
            if hasNotification, let count = notificationCount {
                Text("\(count)")
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color.red)
                    .clipShape(Circle())
            }
        }
        .offset(x: 30)
        .padding()
        //        .background(Color.black.opacity(0.1))
        .cornerRadius(12)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
