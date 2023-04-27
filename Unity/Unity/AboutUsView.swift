//
//  AboutUsView.swift
//  Unity
//
//  Created by Matthew Ray Lee on 4/27/23.
//

import SwiftUI

struct AboutUsView: View {
    @EnvironmentObject var model: Unity
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(model.isDarkMode ? Color(UIColor(red: 87/255, green: 95/255, blue: 101/255, alpha: 1.0)) : Color.white)
    }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView().environmentObject(Unity())
    }
}
