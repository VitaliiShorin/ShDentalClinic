//
//  ReviewFormView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 14.05.2025.
//

import SwiftUI

struct ReadAndWriteAReviewView: View {
    let doctor: Doctor
    
    @EnvironmentObject var reviewsVM: ReviewsViewModel
    @EnvironmentObject var userVM: UserViewModel
    @State var selection = "1"
    
    var body: some View {
        Picker("", selection: $selection) {
            Text("Прочитать").tag("1")
            Text("Написать").tag("2")
        }
        .pickerStyle(.segmented)
        .padding()
        
        if selection == "1" {
            let doctorReviews = reviewsVM.reviews(forDoctor: doctor.fullName)
            if doctorReviews.isEmpty {
                Text("Пока нет отзывов. Оставьте свой!").foregroundStyle(.gray)
            } else {
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(doctorReviews) { review in
                            ReviewsAboutTheDoctorView(
                                patientName: review.patientName,
                                date: Self.dateString(review.date),
                                numberOfStars: "\(review.numberOfStars)",
                                reviewText: review.reviewText
                            )
                        }
                    }
                    .padding()
                }
            }
            Spacer()
        } else {
            WriteAReviewView(doctor: doctor) { reviewText, stars in
                let patientName = userVM.user?.name ?? "Аноним"
                reviewsVM.addReview(for: doctor, patientName: patientName, stars: stars, text: reviewText)
                selection = "1"
            }
            Spacer()
        }
    }
    
    static func dateString(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter.string(from: date)
    }
}


#Preview {
    ReadAndWriteAReviewView(doctor: doctors[0])
        .environmentObject(ReviewsViewModel())
        .environmentObject(UserViewModel())
}
