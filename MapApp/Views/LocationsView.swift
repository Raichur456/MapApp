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
            VStack(spacing: 0) {
                header
                    .padding()
                
                Spacer()
            }
            
            
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
extension LocationsView {
    private var header : some View {
        VStack {
            Button(action: vm.toggleLocationsList) {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height:55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value : vm.mapLocation)
                    .background(Color.gray)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationList ? 180 : 0))
                    }
            }
            if vm.showLocationList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black, radius: 20, x : 0,y : 15)
    }
}
