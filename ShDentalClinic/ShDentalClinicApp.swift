//
//  ShDentalClinicApp.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 06.05.2025.
//

import SwiftUI

@main
struct ShDentalClinicApp: App {
    @StateObject var reviewsVM = ReviewsViewModel()
    @StateObject var appointmentVM = BookedAppointmentsViewModel()
    @StateObject var userVM = UserViewModel()
    @StateObject var callbackVM = CallbackRequestsViewModel()
    @StateObject var appointmentCopyStorage = AdminAppointmentsCopyStorage()

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
