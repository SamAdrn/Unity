//
//  ContentView.swift
//  Unity
//
//  Created by Samuel Kosasih on 3/29/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: Unity
    @State private var showSplash = true
    
    
    var body: some View {
        ZStack {
            if showSplash {
                LaunchScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            showSplash = false
                        }
                    }
            } else {
                TbView().environmentObject(vm)
            }
        }
        
    }
}

struct TbView: View {
    @EnvironmentObject var vm: Unity
    @State private var selection = 1
    private var iconSize: CGFloat = 1000
    
    var body: some View {
        TabView(selection: $selection) {
            
            StoreView().tabItem {
                Label("", systemImage: "bag.fill")
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

struct LaunchScreen: View {
    @State private var showUnity = false
    
    var body: some View {
        ZStack {
            Color.white
            
            Text("Unity")
                .font(.system(size: 100))
                .foregroundColor(.black)
                .opacity(showUnity ? 0.0 : 1.0)
                .animation(.easeInOut(duration: 2.0))
                .onAppear {
                    withAnimation {
                        showUnity = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        withAnimation {
                            showUnity = false
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            // Transition to the next screen here
                        }
                    }
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Unity())
    }
}
