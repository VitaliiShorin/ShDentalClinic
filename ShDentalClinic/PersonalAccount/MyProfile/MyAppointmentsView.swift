//
//  MyAppointmentsView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 02.06.2025.
//

import SwiftUI

struct MyAppointmentsView: View {
    @EnvironmentObject var appointmentVM: BookedAppointmentsViewModel
    @EnvironmentObject var userVM: UserViewModel
    
    var myAppointments: [BookedAppointment] {
        guard let user = userVM.user else { return [] }
        return appointmentVM.appointments(for: user.id)
    }
    
    var body: some View {
        ZStack {
            LinearGradientView()
            
            ScrollView {
                VStack {
                    Text("Мои записи на прием")
                        .font(.title3.bold())
                        .padding(.bottom)
                    
                    if myAppointments.isEmpty {
                        Text("Записей на прием еще нет.")
                            .foregroundStyle(.secondary)
                            .padding(.top)
                    } else {
                        ForEach(myAppointments) { appointment in
                            AppointmentCardView(appointment: appointment)
                                .padding(.bottom, 5)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    MyAppointmentsView()
        .environmentObject(BookedAppointmentsViewModel())
        .environmentObject(UserViewModel())
}
