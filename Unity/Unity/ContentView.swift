//
//  ContentView.swift
//  Unity
//
//  Created by Samuel Kosasih on 3/29/23.
//

import SwiftUI
//import MapKit

struct ContentView: View {
    var body: some View {
        HeaderView()
        ZStack {
            MapView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
