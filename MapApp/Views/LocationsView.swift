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
            Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                .font(.title2)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .frame(height:55)
                .frame(maxWidth: .infinity)
                .background(Color.red)
                .overlay(alignment: .leading) {
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding()
                }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black, radius: 20, x : 0,y : 15)
    }
}
