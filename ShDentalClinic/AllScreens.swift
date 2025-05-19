//
//  AllScreens.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 11.05.2025.
//

import Foundation
import SwiftUICore

enum Screen {
    case test1
    case test2
    case test3
    case record
    case price
    case ourDoctors
    case reviews
    case address
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .test1:
            Test1View()
        case .test2:
            AboutTheDoctorView(doctor: doctors[0]) // Готов
                .environmentObject(ReviewsViewModel())
        case .test3:
            Test3View()
        case .record:
            Test1View()
        case .price:
            TreatmentCostsView()
        case .ourDoctors:
            OurDoctorsView(doctors: doctors) // Готов
        case .reviews:
            ReviewsView(doctors: doctors)
        case .address:
            ClinicAddressAndContactsView() // Готов
        }
    }
}
