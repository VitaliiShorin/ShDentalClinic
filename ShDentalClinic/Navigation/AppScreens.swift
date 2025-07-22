//
//  AppScreens.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 11.05.2025.
//

import Foundation
import SwiftUI

enum Screen {
    case appointment
    case price
    case ourDoctors
    case reviews
    case address
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .appointment:
            AppointmentSchedulingView()
        case .price:
            TreatmentCostsView()
        case .ourDoctors:
            OurDoctorsView(doctors: doctors)
        case .reviews:
            ReviewsView(doctors: doctors)
        case .address:
            ClinicAddressAndContactsView()
        }
    }
}
