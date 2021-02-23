//
//  ContentView.swift
//  WeSplit
//
//  Created by Yang Dev Luo on 2021/1/30.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Order")) {
                    TextField("Amount", text:$checkAmount)
                        .keyboardType(.decimalPad)
                }
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2 ..< 100) {
                        Text("\($0) people")
                    }
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                Section(header: Text("Pay Amount")) {
                    Text("$\(payAmount, specifier: "%.2f")").foregroundColor(tipPercentage == 4 ? .red : .black)
                }
            }.navigationTitle("WeSplit")
        }
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        
        let amountPerPerson = self.payAmount / peopleCount

        return amountPerPerson
    }
    
    var payAmount: Double {
        
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
