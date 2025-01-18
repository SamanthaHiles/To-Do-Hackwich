//
//  ContentView.swift
//  To Do Hackwich
//
//  Created by Samantha Hiles on 1/18/25.
//

import SwiftUI

struct ContentView: View {
    @State private var  things = ["First Thing", "Second Thing", "Third Thing", "Forth Thing", "Fifth Thing"]
    var body: some View {
        NavigationView {
            List {
                ForEach(things, id: \.self) { thing in
                    Text(thing)
                }
                .onMove(perform: { indices, newOffset in
                    things.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    things.remove(atOffsets: indexSet)
                })
            }
            .navigationBarTitle("Things", displayMode: .inline)
            .navigationBarItems(leading: EditButton())
        }
    }
}

#Preview {
    ContentView()
}
