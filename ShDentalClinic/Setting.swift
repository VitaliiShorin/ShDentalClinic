//
//  Setting.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 07.05.2025.
//

import Foundation
import SwiftUICore

enum Screen {
    case test
    case record
    case price
    case ourDoctors
    case reviews
    case address
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .test:
            TestView()
        case .record:
            TestView()
        case .price:
            TestView()
        case .ourDoctors:
            OurDoctorsView()
        case .reviews:
            TestView()
        case .address:
            TestView()
        }
    }
}
