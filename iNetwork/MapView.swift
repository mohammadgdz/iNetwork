//
//  MapView.swift
//  iNetwork
//
//  Created by Mohammad on 2025-06-29.
//

import CoreLocation
import MapKit
import SwiftUI

struct MapView: View {
    let coordinate: CLLocationCoordinate2D
    @State private var cameraPosition: MapCameraPosition

    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        let region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
        _cameraPosition = State(initialValue: .region(region))
        
    }

    var body: some View {
        Map(position: $cameraPosition) {
            Marker("You are here", coordinate: coordinate)
        }
        
        .cornerRadius(12)
        .padding()
        
    }
}

extension InfoModel {
    var coordinate: CLLocationCoordinate2D? {
        guard let loc = loc else { return nil }
        let parts = loc.split(separator: ",").map { Double($0) }
        if let lat = parts.first ?? nil, let long = parts.last ?? nil {
            return CLLocationCoordinate2D(latitude: lat, longitude: long)
        }
        return nil
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 10.0, longitude: 0.0))
}
