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
            AboutTheDoctorView(photo: doctors[0].imageName, fullName: doctors[0].fullName, speciality: doctors[0].speciality, education: doctors[0].education, certificate: doctors[0].certificate, continuingEducation: doctors[0].continuingEducation, professionalSkills: doctors[0].professionalSkills)
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


