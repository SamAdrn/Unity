//
//  MapView.swift
//  Unity
//
//  Created by Samuel Kosasih on 3/29/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var vm: Unity
    
    @State var ustm: MapUserTrackingMode = MapUserTrackingMode.follow
    
    var body: some View {
        
        VStack {
            Text("Unity")
                .font(.system(size: 48, weight: .bold))
                .padding(20)
                .foregroundColor(vm.isDarkMode ? Color.white : Color.black)
            
            Spacer()
            
            
            ZStack (alignment: .bottomLeading) {
                
                Map(
                    coordinateRegion: $vm.region,
                    showsUserLocation: true,
                    userTrackingMode: $ustm
                )
                .frame(width: 400, height: 500)
                
                
                if vm.isAuthorized {
                    Rectangle()
                        .opacity(0.3)
                        .frame(width: 100, height: 150)
                        .overlay(
                            VStack {
                                Text("Today's Step Count")
                                    .font(.title3)
                                    .foregroundColor(vm.isDarkMode ? Color.white : Color.black)
                                
                                Text("\(vm.userStepCount)")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(vm.isDarkMode ? Color.white : Color.black)
                            }
                        )
                        .padding(30)
                } else {
                    VStack {
                        Text("Please Authorize Health!")
                            .font(.title3)
                            .foregroundColor(vm.isDarkMode ? Color.white : Color.black)
                        
                        Button {
                            vm.healthRequest()
                        } label: {
                            Text("Authorize HealthKit")
                                .font(.headline)
                                .foregroundColor(vm.isDarkMode ? Color.black : Color.white)
                        }
                        .frame(width: 320, height: 55)
                        .background(Color(.orange))
                        .cornerRadius(10)
                    }
                }
                
                Spacer()
            }.onAppear {
                vm.readStepsTakenToday()
            }
            Spacer()
            
        }.background(vm.isDarkMode ? Color(UIColor(red: 87/255, green: 95/255, blue: 101/255, alpha: 1.0)) : Color.white)
    }
    
    struct MapView_Previews: PreviewProvider {
        static var previews: some View {
            MapView().environmentObject(Unity())
        }
    }
}
