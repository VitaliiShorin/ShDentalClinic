//
//  AppointmentSchedulingView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 19.05.2025.
//

import SwiftUI
// 100 %
// Стартовый экран раздела "Записаться на прием"
struct AppointmentSchedulingView: View {
    @State var selection = "1"
    @EnvironmentObject var appointmentVM: BookedAppointmentsViewModel
    
    var body: some View {
        VStack {
            Picker("", selection: $selection) {
                Text("Связаться с клиникой").tag("1")
                Text("Online запись").tag("2")
            }
            .pickerStyle(.segmented)
            .padding([.horizontal, .top])
            
            if selection == "1" {
                CallTheClinicView()
            } else {
                OnlineBookingView()
            }
        }
    }
}

#Preview {
    AppointmentSchedulingView()
        .environmentObject(BookedAppointmentsViewModel())
}
