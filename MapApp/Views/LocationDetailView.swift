//
//  LocationDetailView.swift
//  MapApp
//
//  Created by Gururaj Krishna on 7/29/25.
//

import SwiftUI
import MapKit
struct LocationDetailView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    let location: Location
    var body: some View {
        ScrollView {
            VStack {
                images
                    .shadow(
                        color: Color.black.opacity(0.6),
                        radius: 10,
                        x: 5,
                        y: 10
                    )
                titleSection
                Divider()
                descriptionSection
                Divider()
                mapLayer
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(backButton, alignment: .topLeading)
    }
}

#Preview {
    LocationDetailView(location : LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
}
extension LocationDetailView {
   private var images : some View {
        TabView {
            ForEach(location.imageNames, id: \.self) {image in
                    Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width:UIDevice.current.userInterfaceIdiom == .pad ? nil : UIScreen.main.bounds.width )
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection: some View {
        VStack(alignment:.leading, spacing : 16) {
            VStack(alignment:.leading, spacing : 16) {
                Text(location.name)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text(location.cityName)
                    .font(.title3)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding()
        }
    }
    
    private var descriptionSection: some View {
            VStack(alignment:.leading, spacing : 16) {
                Text(location.description)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    
                if let url = URL(string: location.link) {
                    Link("Read more on Wikipedia", destination: url)
                        .tint(.blue)
                }
            }
            .padding(10)
        
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: location.coordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))),
            annotationItems:[location]) { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .shadow(radius:10)
            }
        }
            .allowsHitTesting(false)
            .aspectRatio(1, contentMode:.fit)
            .cornerRadius(30)
       
//        Map(coordinateRegion:$vm.mapRegion, annotationItems: vm.locations, annotationContent: {location in
//            MapAnnotation(coordinate: location.coordinates) {
//                Text("Hello")
//                LocationMapAnnotationView()
//                    .scaleEffect(vm.mapLocation == location ? 1: 0.7)
//                    .onTapGesture {
//                        vm.showNextLocation(location: location)
//                    }
//            }
//        })

    }
    
    private var backButton: some View {
        Button {
            vm.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .padding()
            
        }
    }
}
