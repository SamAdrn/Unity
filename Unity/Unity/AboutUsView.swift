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
        Text("About Us")
            .font(.largeTitle)
            .padding(.top, 25)
            .foregroundColor(model.isDarkMode ? Color.white : Color.black)
        Spacer()
        VStack {
            Text("This is out CMSC436 group project. The purpose of this application is to gameify getting your daily steps in. Additionally, giving you notifications to remind you and in app acheievements and stores where you can purchase and earn gallery items with your steps walked.")
                .padding(.bottom, 5)
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
