//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Yang Dev Luo on 2021/2/7.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    init(rows: Int, columns: Int, @ViewBuilder _ content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView1: View {
    var body: some View {
        GridStack(rows: 3, columns: 3) { (row, col) in
            Text("R\(row)C\(col)")
            Text("R\(row)C\(col)")
        }
    }
}
struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct BlueTitle : ViewModifier {
    func body(content: Content) -> some View {
        content.font(.title).foregroundColor(.blue)
    }
}
extension View {
    func blueTitle() -> some View {
        self.modifier(BlueTitle())
    }
}

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

struct ContentView: View {
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true, content: {
            VStack(spacing: 10) {
                Label("Lightning", systemImage: "bolt.fill")
                
                Button("Hello World") {
                    // do nothing
                }
                .background(Color.red)
                .frame(width: 200, height: 200)
                .border(Color.black, width: 1)
                Text("Hello World1")
                    .padding()
                    .background(Color.red)
                    .padding()
                    .background(Color.blue)
                    .padding()
                    .background(Color.green)
                    .padding()
                    .background(Color.yellow)
                Text("Hello World2")
                    .modifier(Title())
                Text("Hello World3")
                    .blueTitle()
                Color.blue
                    .frame(width: 300, height: 200)
                    .watermarked(with: "Hacking with Swift")
                CapsuleText(text: "First")
                    .foregroundColor(.red)
                CapsuleText(text: "Second")
                    .foregroundColor(.yellow)
                //                GridStack(rows: 3, columns: 3) { row, col in
                //                    Text("R\(row)C\(col)")
                //                }
                GridStack(rows: 3, columns: 3) { (row, col) in
                    Text("R\(row)C\(col)")
                    Text("R\(row)C\(col)")
                    Text("R\(row)C\(col)")
                    Text("R\(row)C\(col)")
                    Text("R\(row)C\(col)")
                    Text("R\(row)C\(col)")
                    Text("R\(row)C\(col)")
                    Text("R\(row)C\(col)")
                    Text("R\(row)C\(col)")
                    Text("R\(row)C\(col)")
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
