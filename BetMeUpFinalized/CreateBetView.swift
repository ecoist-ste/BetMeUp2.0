//
//  CreateBetView.swift
//  BetMeUp
//
//  Created by Songyuan Liu on 10/19/24.
//

import SwiftUI

struct CreateBetView: View {
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
                        VStack {
                            Text("Wager Description")
                                .font(.title3)
                                .padding(.horizontal)
                                .offset(y:10)
                            TextField("Describe what this bet is about", text: $wagerDescription)
                                .textFieldStyle(PlainTextFieldStyle())
                                .padding(10)
                                .background(Color.gray.opacity(0.2)) // Gray background
                                .cornerRadius(8)
                                .padding()
                        }
                        .padding(.bottom)
                        
                        
                        Text("Minimum Entry ($)")
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
                        
                        HStack {
                            Spacer()
                            Text("Add Outcomes")
                                .font(.title3)
                            Spacer()
                            
                        }
                        .padding()
                        
                        ForEach(outcomes.indices, id: \.self) { index in
                            TextField("Outcome \(index + 1)", text: $outcomes[index])
                                .textFieldStyle(PlainTextFieldStyle())
                                .padding(10)
                                .background(Color.gray.opacity(0.2)) // Gray background
                                .cornerRadius(8)
                                .padding()
                        }
                        
                        Button(action: {
                            outcomes.append("")
                        }, label: {
                            Image(systemName: "plus.circle")
                        })
                        
                        
                        
                        
                        
                        
                        
                    }
                    Text("Deadline to Place Bets")
                        .font(.title3)
                        .padding(.horizontal)
                        .offset(y: 20)
                    
                    DatePicker(
                        "Date",
                        selection: $deadline,
                        displayedComponents: [.date] // Shows only the date (no time picker)
                    )
                    .datePickerStyle(GraphicalDatePickerStyle()) // Display as a graphical calendar
                    .padding()
                }
            }
            .padding()
            .navigationTitle("Create Wager")
            .navigationBarTitleDisplayMode(.automatic) // Ensures the custom title fits inline
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // TODO: Confirm implmentation
                        if minimumEntryAmount.isEmpty || maximumLosingAmount.isEmpty || wagerDescription.isEmpty {
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
    CreateBetView()
}
