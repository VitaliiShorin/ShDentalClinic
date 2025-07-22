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
                ForEach(doctors) { doctor in
                    SectionForDoctorView(doctor: doctor)
                }
            }
            .padding(.vertical)
        }
        .navigationTitle("Наши врачи")
        .padding([.top, .bottom], 1)
    }
}

#Preview {
    OurDoctorsView(doctors: doctors)
        .environmentObject(ReviewsViewModel())
}
