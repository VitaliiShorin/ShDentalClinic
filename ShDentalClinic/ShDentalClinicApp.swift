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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(reviewsVM)
        }
    }
}
