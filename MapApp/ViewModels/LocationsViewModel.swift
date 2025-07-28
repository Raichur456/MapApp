//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by Gururaj Krishna on 7/28/25.
//

import Foundation

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location]
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}
