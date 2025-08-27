//
//  ReviewsAboutTheDoctorView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 12.05.2025.
//

import SwiftUI

struct ReviewsAboutTheDoctorView: View {
    let patientName: String
    let date: String
    let numberOfStars: String
    let reviewText: String
    
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image(systemName: "ellipsis.bubble")
                    .font(.title)
                    .foregroundStyle(.blue)
                VStack(alignment: .leading) {
                    Text(patientName)
                        .font(.subheadline.bold())
                    Text(date)
                        .font(.footnote)
                }
                
                Spacer()
                
                HStack(spacing: 5) {
                    Image(systemName: "star.fill")
                        .font(.body)
                        .foregroundStyle(.gold)
                    Text(numberOfStars)
                        .font(.body)
                }
            }
            .padding(.bottom, 8)
            
            Text(reviewText)
                .font(.subheadline)
        }
        .padding()
        .background(.white)
        .cornerRadius(15)
        .shadow(radius: 4)
    }
}

#Preview {
    ReviewsAboutTheDoctorView(
        patientName: "Виктория",
        date: "5 дней назад",
        numberOfStars: "5",
        reviewText: "Здесь будет текст отзыва пациента"
    )
        .environmentObject(ReviewViewModel())
        .environmentObject(UserViewModel())
}
