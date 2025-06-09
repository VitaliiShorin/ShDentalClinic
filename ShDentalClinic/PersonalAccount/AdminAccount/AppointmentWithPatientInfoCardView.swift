//
//  AppointmentWithPatientInfoCardView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 08.06.2025.
//

import SwiftUI

struct AppointmentWithPatientInfoCardView: View {
    @EnvironmentObject var userVM: UserViewModel
    let appointment: BookedAppointment
    
    var body: some View {
        let patient = userVM.users.first(where: { $0.id == appointment.userID })
        
        VStack(alignment: .leading, spacing: 8) {
            if let user = patient {
                Text("\(user.surname) \(user.name) \(user.patronymic)")
                    .font(.headline)
                Text("Телефон: \(formattedPhoneNumber(user.phone))")
                    .foregroundStyle(.secondary)
            } else {
                Text("Пациент не зарегистрирован")
                    .font(.headline)
                    .foregroundColor(.red)
            }
            
            VStack(alignment: .leading) {
                Text("Врач: \(appointment.doctorName)")
                    .font(.callout.bold())
                Text("Дата: \(AppointmentCardView.dateStr(appointment.date))")
                Text("Время: \(appointment.hour)")
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white)
        .cornerRadius(15)
        .shadow(radius: 3)
        .padding(.horizontal)
    }
}

#Preview {
    AppointmentWithPatientInfoCardView(appointment: BookedAppointment(
        id: UUID(),
        userID: UUID(),
        doctorName: "Иванов \nИван \nИванович",
        doctorImage: "Анатолий",
        date: Date(),
        hour: "14:30"
    ))
    .environmentObject(UserViewModel())
}
