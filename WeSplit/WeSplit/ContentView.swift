//
//  ContentView.swift
//  WeSplit
//
//  Created by Yang Dev Luo on 2021/1/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Form {
                Section {
                    Text("Hello World")
                }
                Section {
                    Text("Hello World")
                    Text("Hello World")
                }
                Group {
                    Text("Hello World")
                    Text("Hello World")
                    Text("Hello World")
                    Text("Hello World")
                    Text("Hello World")
                    Text("Hello World")
                }
            }.navigationBarTitle("SwiftUI", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
