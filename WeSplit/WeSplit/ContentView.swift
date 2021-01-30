//
//  ContentView.swift
//  WeSplit
//
//  Created by Yang Dev Luo on 2021/1/30.
//

import SwiftUI

struct ContentView: View {
    @State var name = ""
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Name", text: $name)
            Text("hello \(name)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
