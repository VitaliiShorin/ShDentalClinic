//
//  Setting.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 07.05.2025.
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
            Test2View()
        case .test3:
            Test3View()
        case .record:
            Test1View()
        case .price:
            Test1View()
        case .ourDoctors:
            OurDoctorsView(doctors: doctors)
        case .reviews:
            Test1View()
        case .address:
            Test1View()
        }
    }
}
