//
//  ShDentalClinicApp.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 06.05.2025.
//

import SwiftUI

@main
struct ShDentalClinicApp: App {
    @StateObject var reviewsVM = ReviewViewModel()
    @StateObject var appointmentVM = BookedAppointmentsViewModel()
    @StateObject var userVM = UserViewModel()
    @StateObject var callbackVM = CallbackRequestViewModel()
    @StateObject var appointmentCopyStorage = AdminAppointmentCopyStorage()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(reviewsVM)
                .environmentObject(appointmentVM)
                .environmentObject(userVM)
                .environmentObject(callbackVM)
                .environmentObject(appointmentCopyStorage)
        }
    }
}
