//
//  LocationsView.swift
//  MapApp
//
//  Created by Gururaj Krishna on 7/28/25.
//

import SwiftUI


struct LocationsView: View {
   
@EnvironmentObject private var vm : LocationsViewModel
    var body: some View {
        List {
            ForEach(vm.locations) {
                Text($0.name)
            }
        }
        
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
