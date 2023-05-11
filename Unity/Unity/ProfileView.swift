//
//  ProfileView.swift
//  Unity
//
//  Created by Samuel Kosasih on 3/29/23.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var model: Unity
    @State var update = false
    
    let gearSize: CGFloat = 40
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                
                VStack {
                    
                    ProfilePicture()
                    ProfileInformation()
                    Gallery()
                    Achievements()
                    
                    Spacer()
                }
                
                NavigationLink(destination: SettingsView()) {
                    Image(systemName: "gearshape")
                        .resizable()
                        .frame(width: gearSize, height: gearSize)
                        .padding([.leading, .top], 30)
                }.foregroundColor(model.isDarkMode ? Color.white : Color.black)
                
            }
            .background(model.isDarkMode ? Color(UIColor(red: 87/255, green: 95/255, blue: 101/255, alpha: 1.0)) : Color.white)
        }
    }
}

private struct ProfilePicture: View {
    @EnvironmentObject var model: Unity
    let d: CGFloat = 100
    
    var body: some View {
        Image("944")
            .resizable()
            .scaledToFill()
            .frame(width: d, height: d)
            .foregroundColor(model.isDarkMode ? Color.white : Color.black)
            .clipShape(Circle()).padding(.top, 45).padding(.bottom, 10)
    }
}

private struct ProfileInformation: View {
    
    @State var name: String = ""
    @State var steps: Int = 9000
    @State var miles: Int = 500
    @EnvironmentObject var model: Unity
    
    var body: some View {
        VStack {
            ZStack {
                Text(name)
                TextField("Enter your name", text: $name)
            }
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding([.leading, .trailing], 30)
                .padding([.bottom], 1)
                .foregroundColor(model.isDarkMode ? Color.white : Color.black)
            Text("\(model.userStepCount) Steps (\(String(format: "%.1f", (Double(model.userStepCount))/2000)) miles travelled)")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(1)
                .foregroundColor(model.isDarkMode ? Color.white : Color.black)
        }
    }
}

private struct Gallery: View {
    @EnvironmentObject var model: Unity
    @State var update = false
    let imageSize: CGFloat, gridSize: CGFloat
    
    init() {
        self.imageSize = 70; self.gridSize = self.imageSize;
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Gallery")
                    .font(.headline)
                    .foregroundColor(model.isDarkMode ? .white : .gray)
                    .padding(.leading, 10)
                
                Spacer()
            }
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: gridSize))]) {
                    ForEach(1..<model.purchasedItems.count, id: \.self) { i in
                        Image(systemName: model.purchasedItems[i])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: imageSize, height: imageSize)
                    }
                }
            }
            .padding(.top)
            
        }.onChange(of: model.purchasedItems) { _ in
            update.toggle()
        }.frame(height: 270)
        .padding(.horizontal, 30)
        .padding(.top, 30)
    }
}

private struct Achievements: View {
    @EnvironmentObject var model: Unity
    let trophySize: CGFloat = 50
    
    var body: some View {
        VStack {
            HStack {
                Text("Achievements")
                    .font(.headline)
                    .foregroundColor(model.isDarkMode ? .white : .gray)
                    .padding(.leading, 10)
                Spacer()
            }
            
            ScrollView(.horizontal) {
                HStack {
                    if model.show10kBadge {
                        VStack {
                            Image(systemName: "figure.run")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: trophySize)
                                .foregroundColor(.brown)
                            Text("10k")
                                .font(.callout)
                                .foregroundColor(.black)
                        }.padding()
                    }
                    if model.show20kBadge {
                        VStack {
                            Image(systemName: "figure.run.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: trophySize)
                                .foregroundColor(.gray)
                            Text("20k")
                                .font(.callout)
                                .foregroundColor(.black)
                        }.padding()
                    }
                    if model.show30kBadge {
                        VStack {
                            Image(systemName: "figure.run.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: trophySize)
                                .foregroundColor(.yellow)
                            Text("30k")
                                .font(.callout)
                                .foregroundColor(.black)
                        }.padding()
                    }
                }
            }
        }
        .padding(.horizontal, 30)
        .padding(.top, 20)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(Unity())
    }
}
