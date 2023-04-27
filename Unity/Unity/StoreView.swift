//
//  StoreView.swift
//  Unity
//
//  Created by Samuel Kosasih on 4/27/23.
//

import SwiftUI

struct StoreView: View {
    
    @EnvironmentObject var model: Unity
    
    var body: some View {
        VStack {
            
            Text("Store").font(.title).padding(.top, 20)
                .foregroundColor(model.isDarkMode ? Color.white : Color.black)
            
            StoreGallery(items: model.retrieveStoreItems()).environmentObject(model)
            
        }.background(model.isDarkMode ? Color(UIColor(red: 87/255, green: 95/255, blue: 101/255, alpha: 1.0)) : Color.white)
    }
}

struct StoreGallery: View {
    
    @EnvironmentObject var model: Unity
    
    let imageSize: CGFloat, gridSize: CGFloat
    let items: [StoreItem]
    private let threeColGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    init(items: [StoreItem]) {
        self.imageSize = 90
        self.gridSize = self.imageSize + 10
        self.items = items
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: threeColGrid, spacing: 20) {
                ForEach(0..<items.count) { i in
                    ItemView(item: items[i])
                }
            }.padding(.top, 20)
        }
    }
}

struct ItemView: View {
    @EnvironmentObject var model: Unity
    var item: StoreItem
    var symbolSize: CGFloat = 70
    
    var body: some View {
        
        Group {
            
            VStack {
                Image(systemName: item.symbol)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: symbolSize)
                    .padding(4)
                    .padding(.bottom, 8)
                    .foregroundColor(model.isDarkMode ? Color.white : Color.black)

                Text(item.name).font(.headline)
                    .padding(.vertical, 3)
                    .foregroundColor(model.isDarkMode ? Color.white : Color.black)

                Text("$\(item.price)").font(.caption)
                    .foregroundColor(model.isDarkMode ? Color.white : Color.black)

            }
            .frame(minWidth: 160, minHeight: 190)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(model.isDarkMode ? Color.white : Color.black, lineWidth: 2)
            )
            
        }
        
        
    }
    
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
