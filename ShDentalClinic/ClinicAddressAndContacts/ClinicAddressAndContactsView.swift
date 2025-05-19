//
//  ClinicAddressAndContactsView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 13.05.2025.
//

import SwiftUI
import MapKit

struct ClinicAddressAndContactsView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 55.592510, longitude: 37.593354),
        span: MKCoordinateSpan(latitudeDelta: 0.012, longitudeDelta: 0.012)
    )
    
    struct PointAnnotation: Identifiable {
        let id = UUID()
        let coordinate: CLLocationCoordinate2D
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LogoView()
                .padding(.bottom, 10)

            VStack(alignment: .leading, spacing: 10) {
                createSection(
                    image: "location",
                    title: "Адрес клиники:",
                    content: "117405, г. Москва, Варшивское шоссе, 256к7"
                )
                createSection(
                    image: "tram.fill",
                    title: "Ближайшие станции и метро:",
                    content: "МЦД-2 ст. Красный Строитель\nСтанция метро Улица Академика Янгеля"
                )
                createSection(
                    image: "calendar.badge.checkmark",
                    title: "Режим работы:",
                    content: "По будням: 9:00-20:00\nСуббота: 9:00-19:00\nВоскресенье: 09:00-17:00"
                )
                createSection(
                    image: "phone",
                    title: "Телефон:",
                    content: "+7 (915) 154-**-**"
                )
                
                navigationLinkSection(
                    title: "Лицензии",
                    image: "checkmark.seal.text.page",
                    destination: LicenseView()
                )
                navigationLinkSection(
                    title: "Нормативные документы",
                    image: "text.book.closed",
                    destination: RegulatoryDocumentsView()
                )
                
                Spacer()
            }
            .padding(.top, 7)

            createMapView()
                .frame(height: UIScreen.main.bounds.width / 1.5)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
    
    private func createSection(image: String, title: String, content: String) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: image)
                    .foregroundStyle(.blue)
                Text(title)
                    .font(.body.bold())
            }
            .padding(.bottom, 2)
            Text(content)
                .font(.callout)
                .padding(.leading, 12)
        }
        .frame(width: UIScreen.main.bounds.width - 32, alignment: .leading)
    }
    
    private func navigationLinkSection(title: String, image: String, destination: some View) -> some View {
        NavigationLink(destination: destination) {
            HStack {
                Image(systemName: image)
                    .foregroundStyle(.blue)
                Text(title)
                    .foregroundStyle(.blue)
                    .font(.headline)
            }
            .padding(.vertical, 2)
        }
    }

    private func createMapView() -> some View {
        let annotations = [PointAnnotation(coordinate: CLLocationCoordinate2D(latitude: 55.592510, longitude: 37.593354))]
        return Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, annotationItems: annotations) { item in
            MapPin(coordinate: item.coordinate, tint: .red)
        }
    }
}

#Preview {
    ClinicAddressAndContactsView()
}
