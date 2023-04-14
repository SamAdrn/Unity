//
//  UnityApp.swift
//  Unity
//
//  Created by Samuel Kosasih on 3/29/23.
//

import SwiftUI

@main
struct UnityApp: App {
    var healthVM = Unity()

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(healthVM)
        }
    }
}
