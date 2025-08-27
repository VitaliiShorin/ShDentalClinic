//
//  MapView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 08.07.2025.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 55.592510, longitude: 37.593354),
        span: MKCoordinateSpan(latitudeDelta: 0.012, longitudeDelta: 0.012)
    )
    
    struct PointAnnotation: Identifiable {
        let id = UUID()
        let coordinate: CLLocationCoordinate2D
    }
    
    var body: some View {
        VStack {
            let annotations = [PointAnnotation(
                coordinate: CLLocationCoordinate2D(
                    latitude: 55.592510,
                    longitude: 37.593354
                )
            )]
            return Map(
                coordinateRegion: $region,
                interactionModes: .all,
                showsUserLocation: true,
                annotationItems: annotations
            ) { item in
                MapPin(coordinate: item.coordinate, tint: .red)
            }
            .frame(height: 250)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
}

#Preview {
    MapView()
}
