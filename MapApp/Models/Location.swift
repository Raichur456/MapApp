//
//  Location.swift
//  MapApp
//
//  Created by Gururaj Krishna on 7/28/25.
//

import Foundation
import MapKit
struct Location: Identifiable, Equatable {
    
    
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    //Identifible
    var id : String {
        //name = "Colosseum"
        //cityName = "Rome"
        // id = "ColosseumRome"
        name + cityName
    }
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}

