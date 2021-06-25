//
//  ContentVIew2.swift
//  P1_WeSplit
//
//  Created by Sophia Lu on 6/24/21.
//

import SwiftUI

struct ContentView2: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople:Int = 0
    @State private var tipPercentage = 2
    let tipPercentages = [10, 15, 20, 25, 0]
    
    // Computed property
    var totalPerPerson: Double {
        // calculate the total per person here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
        
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Tips amount", text: $checkAmount).keyboardType(.numberPad)
                
                    Picker("Number of people", selection: $numberOfPeople) {
                         ForEach(2 ..< 10) {
                             Text("\($0) people")
                         }
                     }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }.navigationBarTitle("WeSplit")
        }
        
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
