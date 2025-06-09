//
//  AllAppointmentsView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 06.06.2025.
//

import SwiftUI

struct AllAppointmentsView: View {
    @EnvironmentObject var appointmentCopyStorage: AdminAppointmentsCopyStorage
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 12) {
                if appointmentCopyStorage.copiedAppointments.isEmpty {
                    Text("Записей на прием нет.")
                        .foregroundStyle(.secondary)
                        .padding()
                } else {
                    ForEach(appointmentCopyStorage.copiedAppointments.sorted { $0.date > $1.date }) { copy in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(copy.patientFullName).font(.headline)
                            Text("Телефон: \(formattedPhoneNumber(copy.patientPhone))").foregroundStyle(.secondary)
                            Text("Врач: \(copy.doctorName)").font(.callout.bold())
                            Text("Дата: \(AppointmentCardView.dateStr(copy.date))")
                            Text("Время: \(copy.hour)")
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.white)
                        .cornerRadius(15)
                        .shadow(radius: 3)
                        .padding(.horizontal)
                    }
                }
            }
            .padding(.top)
        }
    }
}

#Preview {
    AllAppointmentsView()
        .environmentObject(AdminAppointmentsCopyStorage())
}
