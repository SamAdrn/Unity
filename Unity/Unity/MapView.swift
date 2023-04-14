//
//  MapView.swift
//  Unity
//
//  Created by Samuel Kosasih on 3/29/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 38.9897, longitude: -76.9378), span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001))
    @EnvironmentObject var vm: Unity
    
    
    var body: some View {
        
        VStack {
            Text("Unity")
                .font(.system(size: 48, weight: .bold))
                .padding(20)
            
            Spacer()
            
            
            ZStack (alignment: .bottomLeading) {
                
                Map(
                    coordinateRegion: $region,
                    showsUserLocation: true,
                    userTrackingMode: .constant(.follow))
                    .frame(width: 400, height: 500)
                
                
                if vm.isAuthorized {
                    Rectangle()
                        .opacity(0.3)
                        .frame(width: 100, height: 150)
                        .overlay(
                            VStack {
                                Text("Today's Step Count")
                                    .font(.title3)
                                
                                Text("\(vm.userStepCount)")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                            }
                        )
                        .padding(30)
                } else {
                    VStack {
                        Text("Please Authorize Health!")
                            .font(.title3)
                        
                        Button {
                            vm.healthRequest()
                        } label: {
                            Text("Authorize HealthKit")
                                .font(.headline)
                                .foregroundColor(.white)
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
            
        }
    }
    
    struct MapView_Previews: PreviewProvider {
        static var previews: some View {
            MapView()
        }
    }
}
