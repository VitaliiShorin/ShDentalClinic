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
    @State var selection = 0
    
    var doctorReviews: [DoctorReview] {
        reviewsVM.reviews(forDoctor: doctor.fullName)
    }
    
    var body: some View {
        VStack {
            Picker("", selection: $selection) {
                Text("Прочитать").tag(0)
                Text("Написать").tag(1)
            }
            .pickerStyle(.segmented)
            .padding()
            
            if selection == 0 {
                if doctorReviews.isEmpty {
                    Text("Пока нет отзывов. Оставьте свой!")
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                } else {
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(doctorReviews) { review in
                                ReviewsAboutTheDoctorView(
                                    patientName: review.patientName,
                                    date: Self.dateStr(review.date),
                                    numberOfStars: "\(review.numberOfStars)",
                                    reviewText: review.reviewText
                                )
                            }
                        }
                        .padding()
                    }
                }
            } else {
                WriteAReviewView(doctor: doctor) {
                    reviewText,
                    stars in
                    let patientName = userVM.user?.name ?? "Аноним"
                    reviewsVM.addReview(
                        for: doctor,
                        patientName: patientName,
                        stars: stars,
                        text: reviewText
                    )
                    selection = 0
                }
            }
        }
    }
    
    static func dateStr(_ date: Date) -> String {
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
