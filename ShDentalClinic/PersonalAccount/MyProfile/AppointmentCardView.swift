//
//  AppointmentCardView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 06.06.2025.
//

import SwiftUI

struct AppointmentCardView: View {
    let appointment: BookedAppointment

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Image(appointment.doctorImage)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: 80, height: 80)
                VStack(alignment: .leading) {
                    Text("Врач:")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    Text(appointment.doctorName)
                        .font(.callout.bold())
                        .foregroundStyle(.primary)
                }
                Spacer()
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Дата приема:")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    Text(Self.dateStr(appointment.date))
                        .font(.callout.bold())
                        .foregroundStyle(.primary)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Время:")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    Text(appointment.hour)
                        .font(.callout.bold())
                        .foregroundStyle(.primary)
                }
            }
            .padding(.top, 6)
        }
        .padding()
        .background(.white)
        .cornerRadius(15)
        .shadow(radius: 2)
    }

    static func dateStr(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter.string(from: date)
    }
}

#Preview {
    AppointmentCardView(
        appointment: BookedAppointment(
            id: UUID(),
            userID: UUID(),
            doctorName: "Иванов Иван Иванович",
            doctorImage: "Анатолий",
            date: Date(),
            hour: "14:30"
        )
    )
}
