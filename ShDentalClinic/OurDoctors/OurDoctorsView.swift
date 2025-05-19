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
                    SectionForDoctorView(doctor: doctor)
                }
            }
            .padding()
        }
        .navigationTitle("Наши врачи")
        .padding(.bottom, 1)
        .padding(.top, 1)
    }
}

#Preview {
    OurDoctorsView(doctors: doctors)
        .environmentObject(ReviewsViewModel())
}
