//
//  ContentView.swift
//  Unity
//
//  Created by Samuel Kosasih on 3/29/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            TbView()
        }
        
    }
}
struct TbView: View {
    
    @State private var selection = 1
    private var iconSize: CGFloat = 1000
    
    var body: some View {
        TabView(selection: $selection) {
            
            Group { Text("Camera") }.tabItem {
                Image(systemName: "camera")
                    .font(.title)
            }.tag(1)
            
            MapView().tabItem {
                Image(systemName: "house")
            }.tag(2)
            
            ProfileView().tabItem {
                Image(systemName: "person.crop.circle")
            }.tag(3)
            
        }.onAppear {
            selection = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
