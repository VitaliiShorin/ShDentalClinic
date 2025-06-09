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

    var body: some View {
        ZStack {
            LinearGradientView()
            
            ScrollView {
                VStack {
                    Text("Мои записи на прием")
                        .font(.title3.bold())
                        .padding(.vertical)
                    
                    if let user = userVM.user {
                        let myAppointments = appointmentVM.appointments(for: user.id)
                        if myAppointments.isEmpty {
                            Text("Записей на прием еще нет.")
                                .foregroundStyle(.secondary)
                                .padding(.top)
                        } else {
                            ForEach(myAppointments) { appt in
                                AppointmentCardView(appointment: appt)
                                    .padding(.bottom, 5)
                            }
                        }
                    }
                    
                    Spacer()
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
