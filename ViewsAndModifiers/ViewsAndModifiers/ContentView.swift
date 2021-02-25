//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Yang Dev Luo on 2021/2/7.
//

import SwiftUI
struct BlueTitle : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.blue)
    }
}

extension View {
    func blueTitle() -> some View {
        self.modifier(BlueTitle())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello World")
            .blueTitle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
