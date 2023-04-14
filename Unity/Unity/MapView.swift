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
                
                Rectangle()
                    .opacity(0.3)
                    .frame(width: 100, height: 150)
                    .padding(30)
            }
            
            Spacer()
        }
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
