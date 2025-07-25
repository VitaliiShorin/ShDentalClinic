//
//  AboutTheDoctorView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 10.05.2025.
//

import SwiftUI

struct AboutTheDoctorView: View {
    let doctor: Doctor
    
    @State var selection = 0
    @EnvironmentObject var reviewsVM: ReviewViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack(alignment: .top, spacing: 16) {
                    Image(doctor.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 170)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(radius: 5)
                    
                    VStack(alignment: .leading) {
                        Text(doctor.name)
                        Text(doctor.surname)
                        Text(doctor.patronymic)
                        Text(doctor.speciality)
                            .font(.subheadline)
                            .padding(.top, 8)
                    }
                    .font(.callout.weight(.bold))
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 8)
                
                Picker("", selection: $selection) {
                    Text("О враче").tag(0)
                    Text("Отзывы").tag(1)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .padding(.vertical, 8)
                
                if selection == 0 {
                    AboutTheDoctorEducationView(doctor: doctor)
                } else {
                    let doctorReviews = reviewsVM.reviews(forDoctor: doctor.fullName)
                    if doctorReviews.isEmpty {
                        Text("Отзывов пока нет. Оставьте свой!")
                            .foregroundStyle(.gray)
                    } else {
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
                        .padding(.horizontal)
                    }
                }
            }
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
    AboutTheDoctorView(doctor: doctors[3])
        .environmentObject(ReviewViewModel())
}
