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
            ZStack {
                Map(
                    coordinateRegion: $vm.region,
                    showsUserLocation: true,
                    userTrackingMode: $ustm
                )
                .frame(width: 400, height: 780)
                .padding(.bottom, 90)
                .overlay(
                    Text("Unity")
                        .font(.system(size: 48, weight: .bold))
                        .padding(20)
                        .foregroundColor(Color.black)
                        .offset(x: 0, y: -325)
                )
                
                if vm.isAuthorized {
                    ZStack {
                        Rectangle()
                            .frame(width: 100, height: 125)
                            .foregroundColor(vm.isDarkMode ? Color.white : Color.black)
                            .opacity(0.4)
                            .offset(x: -135, y: 250)
                        VStack {
                            Text("Step Count:")
                                .font(.system(size: 20))
                                .bold()
                                .foregroundColor(vm.isDarkMode ? Color.black : Color.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 5)
                            
                            Text("\(vm.userStepCount)")
                                .font(.system(size: 23))
                                .fontWeight(.bold)
                                .foregroundColor(vm.isDarkMode ? Color.black : Color.white)
                        }.frame(width: 75, height: 180)
                        .padding(50)
                        .offset(x: -145, y: 240)
                    }
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
