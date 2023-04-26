//
//  ContentView.swift
//  Unity
//
//  Created by Samuel Kosasih on 3/29/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: Unity
    
    var body: some View {
        ZStack {
            TbView().environmentObject(vm)
        }
        
    }
}
struct TbView: View {
    @EnvironmentObject var vm: Unity
    @State private var selection = 1
    private var iconSize: CGFloat = 1000
    
    var body: some View {
        TabView(selection: $selection) {
            
            Group { Text("Camera") }.tabItem {
                Label("", systemImage: "camera")
                    .font(.title)
                    .foregroundColor(vm.isDarkMode ? Color.white : Color.gray)
            }.tag(1)

            MapView().tabItem {
                Label("", systemImage: "house")
            }.tag(2)

            ProfileView().tabItem {
                Label("", systemImage: "person.crop.circle")
            }.tag(3)

        }.onAppear {
            selection = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Unity())
    }
}
