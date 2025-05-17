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
    
    var body: some View {
        VStack(spacing: 16) {
            createSectionForReview(
                patientName: patientName,
                date: date,
                numberOfStars: numberOfStars,
                reviewText: reviewText
            )
        }
    }
    
    private func createSectionForReview(
        patientName: String,
        date: String,
        numberOfStars: String,
        reviewText: String
    ) -> some View {
        let width = UIScreen.main.bounds.width - 48
        
        return VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image(systemName: "ellipsis.bubble")
                    .font(.title)
                    .foregroundStyle(.blue)
                    .scaledToFit()
                VStack(alignment: .leading) {
                    Text(patientName)
                        .font(.subheadline.weight(.bold))
                        .fontWeight(.bold)
                    
                    Text(date)
                        .font(.footnote)
                }
                
                Spacer()
                
                HStack(spacing: 5) {
                    Image(systemName: "star.fill")
                        .font(.body)
                        .foregroundStyle(.gold)
                        .scaledToFit()
                    Text(numberOfStars)
                        .font(.body)
                }
            }
            .padding(.bottom, 8)
            
            HStack {
                Text(reviewText)
                    .font(.subheadline)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding()
        .frame(width: width)
        .background(.white)
        .cornerRadius(15)
        .shadow(radius: 4)
    }
}

#Preview {
    ReviewsAboutTheDoctorView(patientName: "Виктория", date: "5 дней назад", numberOfStars: "5", reviewText: "Здесь будет текст отзыва пациента")
        .environmentObject(ReviewsViewModel())
}
