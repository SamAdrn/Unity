//
//  ContactView.swift
//  Unity
//
//  Created by Matthew Ray Lee on 4/27/23.
//

import SwiftUI

struct ContactView: View {
    @EnvironmentObject var model: Unity
    
    var body: some View {
        VStack {
            Text("Team Members")
                .font(.largeTitle)
                .padding(.top, 25)
                .foregroundColor(model.isDarkMode ? Color.white : Color.black)
            Spacer()
            VStack {
                Text("Bezualem, Nathan")
                    .padding(.bottom, 5)
            
                Text("Kosasih, Samuel")
                    .padding(.bottom, 5)
                
                Text("Lee, Matthew")
                    .padding(.bottom, 5)
                                
                Text("Wu, Isaac")
                    .padding(.bottom, 5)
            }
            .font(.title)
            .foregroundColor(model.isDarkMode ? Color.white : Color.black)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(model.isDarkMode ? Color(UIColor(red: 87/255, green: 95/255, blue: 101/255, alpha: 1.0)) : Color.white)
        
        
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView().environmentObject(Unity())
    }
}
