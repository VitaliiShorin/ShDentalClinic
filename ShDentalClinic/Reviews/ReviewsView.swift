//
//  WriteAReviewView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 14.05.2025.
//

import SwiftUI

struct ReviewsView: View {
    let doctors: [Doctor]
    
    @EnvironmentObject var reviewsVM: ReviewViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Text("Выберите врача:")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 8)
                
                ForEach(doctors, id: \.id) { doctor in
                    SectionForDoctorReviewsView(
                        doctor: doctor,
                        numberOfStars: reviewsVM.averageStarsString(forDoctor: doctor.fullName)
                    )
                }
            }
            .padding()
            .background(.gray .opacity(0.08))
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .navigationTitle("Отзывы")
    }
}

#Preview {
    ReviewsView(doctors: doctors)
        .environmentObject(ReviewViewModel())
        .environmentObject(UserViewModel())
}
