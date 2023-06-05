//
//  ContentView.swift
//  WeSplit
//
//  Created by userext on 18/05/23.
//

import SwiftUI

struct ContentView: View {
    //    let trickers: [String] = ["Blueturtle", "Redcat", "Yellowcapybara"]
    //    @State private var selectedTricker = "Blueturtle"
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD")).keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }

        }
        //        VStack {
        //            Button("Tap Count: \(tapCount)") {
        //                tapCount += interece
        //            }
        //            Circle().frame(width: 50).overlay(Image(systemName: "heart").foregroundColor(.blue)).foregroundColor(.red).onTapGesture {
        //                tapCount = 0
        //                interece = -1
        //            }
        //        Form {
        //            ForEach(0..<3) {
        //                TextField("Enter your name", text: $name[$0])
        //                Text("your name is \($0)")
        //            }
        //
        //
        //        }
        //        NavigationView {
        //            Form {
        //                Picker("Select your Tricker", selection: $selectedTricker) {
        //                    ForEach(trickers, id: \.self) {
        //                        Text($0)
        //                    }
        //                    Text ("Capybara")
        //                }
        //            }
        //        }
        //        Form {
        //            Section {
        //                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD")).keyboardType(.decimalPad)
        //                Picker("Number of people", selection: $numberOfPeople) {
        //                    ForEach(2 ..< 100) {
        //                        Text("\($0) people")
        //                    }
        //                }
        //            }
        //
        //            Section {
        //                Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
        //            }
        //        }
    }
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
