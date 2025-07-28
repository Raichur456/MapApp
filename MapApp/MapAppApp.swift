//
//  MapAppApp.swift
//  MapApp
//
//  Created by Gururaj Krishna on 7/28/25.
//

import SwiftUI
import SwiftData

@main
struct MapAppApp: App {
    @StateObject private var vm = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
