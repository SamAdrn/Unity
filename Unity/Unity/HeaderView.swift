//
//  HeaderView.swift
//  Unity
//
//  Created by Samuel Kosasih on 3/29/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Button(action: f) {
                HamburgerView()
            }
            
            Spacer()
            
            Text("Unity").font(.title)
            
            Spacer()
            
            Button(action: f) {
                Profile()
            }
        }
    }
    
    func f() {
        print("You pushed the button!")
    }
}

struct HamburgerView: View {
    
    let w: CGFloat = 40
    let h: CGFloat = 5
    
    var body: some View {
        VStack {
            Rectangle().frame(width: w, height: h)
            Rectangle().frame(width: w, height: h)
            Rectangle().frame(width: w, height: h)
        }.padding()
    }
}

struct Profile: View {
    
    let d: CGFloat = 50
    
    var body: some View {
        Circle().frame(width: d, height: d).padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
