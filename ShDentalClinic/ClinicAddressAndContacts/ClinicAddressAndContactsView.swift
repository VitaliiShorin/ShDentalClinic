//
//  ClinicAddressAndContactsView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 13.05.2025.
//

import SwiftUI

struct ClinicAddressAndContactsView: View {
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LogoView()
                .padding(.bottom, 10)

            VStack(alignment: .leading, spacing: 10) {
                createSection(
                    image: "location",
                    title: "Адрес клиники:",
                    information: "117405, г. Москва, Варшивское шоссе, 256к7"
                )
                createSection(
                    image: "tram.fill",
                    title: "Ближайшие станции и метро:",
                    information: "МЦД-2 ст. Красный Строитель\nСтанция метро Улица Академика Янгеля"
                )
                createSection(
                    image: "calendar.badge.checkmark",
                    title: "Режим работы:",
                    information: "По будням: 9:00-20:00\nСуббота: 9:00-19:00\nВоскресенье: 09:00-17:00"
                )
                createSection(
                    image: "phone",
                    title: "Телефон:",
                    information: "+7 (915) 154-**-**"
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
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 7)
            
            MapView()
        }
    }
    
    private func createSection(
        image: String,
        title: String,
        information: String
    ) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: image)
                    .foregroundStyle(.blue)
                Text(title)
                    .font(.body.bold())
            }
            .padding(.bottom, 2)
            
            Text(information)
                .font(.callout)
                .padding(.leading, 12)
        }
    }
    
    private func navigationLinkSection(
        title: String,
        image: String,
        destination: some View
    ) -> some View {
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
}

#Preview {
    ClinicAddressAndContactsView()
}
