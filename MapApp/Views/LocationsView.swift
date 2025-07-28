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
    
    var body: some View {
        ZStack {
            Map(coordinateRegion : $vm.mapRegion)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
