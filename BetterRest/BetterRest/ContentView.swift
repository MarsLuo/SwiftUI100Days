//
//  ContentView.swift
//  BetterRest
//
//  Created by Yang Dev Luo on 2021/2/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date()
    
    var body: some View {
        Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
            Text("\(sleepAmount, specifier: "%.2g") hours")
        }
        Form {
            DatePicker("Please enter a date", selection: $wakeUp)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
