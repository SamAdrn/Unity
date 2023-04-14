//
//  ProfileView.swift
//  Unity
//
//  Created by Samuel Kosasih on 3/29/23.
//

import SwiftUI

struct ProfileView: View {
    
    let gearSize: CGFloat = 40
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            VStack {
                
                ProfilePicture()
                ProfileInformation()
                Gallery()
                Achievements()
                
                Spacer()
            }
            
            Image(systemName: "gearshape")
                .resizable()
                .frame(width: gearSize, height: gearSize)
                .padding([.leading, .top], 30)
            
        }
    }
}

private struct ProfilePicture: View {
    
    let d: CGFloat = 100
    
    var body: some View {
        Image(systemName: "person.circle")
            .resizable()
            .scaledToFill()
            .frame(width: d, height: d)
            .padding()
            .padding(.top, 45)
    }
}

private struct ProfileInformation: View {
    
    @State var name: String = "Samuel Adrian Kosasih"
    @State var steps: Int = 9000
    @State var miles: Int = 500
    
    var body: some View {
        VStack {
            Text(name)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding([.leading, .trailing], 30)
                .padding([.bottom], 1)
            
            Text("\(steps) Steps (\(miles) miles travelled)")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(1)
        }
    }
}

private struct Gallery: View {
    
    let imageSize: CGFloat, gridSize: CGFloat, plusFrame: CGFloat, plusPadding: CGFloat
    
    init() {
        self.imageSize = 100; self.gridSize = self.imageSize - 20;
        self.plusFrame = self.gridSize / 2
        self.plusPadding = (self.imageSize - self.plusFrame) / 2
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Gallery")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                Spacer()
            }
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: gridSize))]) {
                    ForEach(1..<10) { i in
                        Image("rx7")
                            .resizable()
                            .frame(width: imageSize, height: imageSize)
                    }
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: plusFrame, height: plusFrame)
                        .padding(plusPadding)
                        .foregroundColor(.gray)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1))
                }
            }
            
        }
        .frame(height: 270)
        .padding(.horizontal, 30)
        .padding(.top, 30)
    }
}

private struct Achievements: View {
    
    let trophySize: CGFloat = 50
    
    var body: some View {
        VStack {
            HStack {
                Text("Achievements")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                Spacer()
            }
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<10) { i in
                        Image(systemName: "trophy.circle")
                            .resizable()
                            .frame(width: trophySize, height: trophySize)
                            .padding(.horizontal, 10)
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
        ProfileView()
    }
}
