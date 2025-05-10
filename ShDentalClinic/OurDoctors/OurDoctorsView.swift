//
//  OurDoctorsView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 09.05.2025.
//

import SwiftUI

struct OurDoctorsView: View {
    
    let doctors: [Doctor]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(doctors, id: \.fullName) { doctor in
                    SectionForDoctorsView(
                        fullName: doctor.fullName,
                        speciality: doctor.speciality,
                        imageName: doctor.imageName,
                        screen1: doctor.screen1,
                        action2: doctor.action2,
                        action3: doctor.action3
                    )
                }
            }
            .padding()
        }
        .padding(.bottom, 1)
        .padding(.top, 1)
    }
}

#Preview {
    OurDoctorsView(doctors: doctors)
}
