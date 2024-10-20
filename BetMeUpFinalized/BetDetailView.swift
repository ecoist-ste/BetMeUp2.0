//
//  CreateBetView.swift
//  BetMeUp
//
//  Created by Songyuan Liu on 10/19/24.
//

import SwiftUI

struct BetDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var wagerDescriptions: [String] = ["", "", ""] // Example for three text fields
    @State private var minimumEntryAmount: String = ""
    @State private var minEntry: Double?
    @State private var maximumLosingAmount: String = ""
    @State private var maxLoss: Double?
    @State private var wagerDescription: String = ""
    @State private var deadline: Date = Date()
    @State private var outcomes: [String] = ["", ""]
    @State private var tempOutcome: String = ""
    
    func createOutcomeEntry() -> some View {
        HStack {
            Text("Outcome \(outcomes.count)")
            TextField("Outcome", text: $tempOutcome)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(10)
                .background(Color.gray.opacity(0.2)) // Gray background
                .cornerRadius(8)
                .padding()
        }
        .padding()
        
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack(alignment: .center) {
                        
                        Text("Your Stakes")
                            .font(.title3)
                            .offset(y: 10.0)
                        TextField("value", text: $minimumEntryAmount)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(10)
                            .background(Color.gray.opacity(0.2)) // Gray background
                            .cornerRadius(8)
                            .padding()
                            .onChange(of: minimumEntryAmount) { oldValue, newValue in
                                if let value = Double(newValue) {
                                    minEntry = value
                                } else {
                                    minEntry = nil // Reset if not a valid integer
                                }
                            }
                        
                    }
                }
            }
            .padding()
            .navigationTitle("Place Your Bet")
            .navigationBarTitleDisplayMode(.automatic) // Ensures the custom title fits inline
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // TODO: Confirm implmentation
                        if minimumEntryAmount.isEmpty {
                            print("invalid creation")
                        } else {
                            presentationMode.wrappedValue.dismiss()
                        }
                        
                    }) {
                        Text("Confirm")
                            .foregroundColor(.blue)
                            .fontWeight(.bold)
                    }
                }
            }
            
            
            
        }
        
        
    }
}

#Preview {
    BetDetailView()
}
