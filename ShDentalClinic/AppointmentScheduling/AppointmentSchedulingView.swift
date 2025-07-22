//
//  AppointmentSchedulingView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 19.05.2025.
//

import SwiftUI

struct AppointmentSchedulingView: View {
    @State var selection = 0
    @EnvironmentObject var appointmentVM: BookedAppointmentsViewModel
    
    var body: some View {
        VStack {
            Picker("", selection: $selection) {
                Text("Связаться с клиникой").tag(0)
                Text("Online запись").tag(1)
            }
            .pickerStyle(.segmented)
            .padding([.horizontal, .top])
            
            if selection == 0 {
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
        .environmentObject(CallbackRequestsViewModel())
}
