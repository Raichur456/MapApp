//
//  LocationsView.swift
//  MapApp
//
//  Created by Gururaj Krishna on 7/28/25.
//

import SwiftUI
import MapKit

struct LocationsView: View {
   
@EnvironmentObject private var
    vm : LocationsViewModel
    @State var mapRegion :  MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.2))
    var body: some View {
        ZStack {
            Map(coordinateRegion : $mapRegion)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
