//
//  ContentView.swift
//  Animations
//
//  Created by Yang Dev Luo on 2021/3/25.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount: Double = 1
    
    var body: some View {
        
        Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                self.animationAmount += 360
            }
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 0, z: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
