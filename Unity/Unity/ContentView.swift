//
//  ContentView.swift
//  Unity
//
//  Created by Samuel Kosasih on 3/29/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        HeaderView()
        ZStack {
//            MapView()
            ProfileView()
            TbView()
        }
        
    }
}
struct TbView: View {
    //@EnvironmentObject var game: Triples
    var body: some View {
        TabView {
            ProfileView().tabItem {
                Label("pf", systemImage: "gamecontroller")
            }
            MapView().tabItem {
                Label("map", systemImage: "list.dash")
            }
            /*HeaderView.tabItem {
                Label("a", systemImage: "info.circle")
            }*/
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
