//
//  SettingsView.swift
//  Unity
//
//  Created by Matthew Ray Lee on 4/25/23.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var model: Unity
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack(spacing: 175) {
                    Text("Dark Mode")
                        .font(.system(size: 20))
                    Toggle("", isOn: $model.isDarkMode)
                        .labelsHidden()
                }
                Divider()
                    .frame(width: 330, height: 2)
                    .background(model.isDarkMode ? Color.white : Color.black)
                    .padding(.bottom, 10)
                NavigationLink (
                    destination: StoreView(),
                    label: {
                        Text("Avatar Store")
                            .font(.system(size: 20))
                    })
                Divider()
                    .frame(width: 330, height: 2)
                    .background(model.isDarkMode ? Color.white : Color.black)
                    .padding(.bottom, 10)
                
                NavigationLink (
                    destination: AboutUsView(),
                    isActive: $model.isShowingAboutUs,
                    label: {
                        Text("About Us")
                            .font(.system(size: 20))
                    })
                Divider()
                    .frame(width: 330, height: 2)
                    .background(model.isDarkMode ? Color.white : Color.black)
                    .padding(.bottom, 10)
                NavigationLink (
                    destination: ContactView(),
                    isActive: $model.isShowingContact,
                    label: {
                        Text("Contact")
                            .font(.system(size: 20))
                    })
            }.foregroundColor(model.isDarkMode ? Color.white : Color.black)
            
            
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {}, label: {
            Text("Unity")
                .font(.largeTitle)
                .foregroundColor(model.isDarkMode ? Color.white : Color.black)
                .bold()
                .padding(.leading, 15)
            
        }) , trailing:
                                Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "xmark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .padding(.trailing, 30)
                .foregroundColor(model.isDarkMode ? Color.white : Color.black)
        })
        )
        .padding(.top, 25)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(model.isDarkMode ? Color(UIColor(red: 87/255, green: 95/255, blue: 101/255, alpha: 1.0)) : Color.white)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(Unity())
    }
}
