//
//  AboutTheDoctorView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 10.05.2025.
//

import SwiftUI

struct AboutTheDoctorView: View {
    let doctor: Doctor
    
    @State var selection = "1"
    @EnvironmentObject var reviewsVM: ReviewsViewModel
    
    var body: some View {
        let width = UIScreen.main.bounds.width - 32
        let height = width
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack {
                    Spacer()
                    Image(doctor.imageName)
                        .resizable()
                        .frame(width: width / 2.1, height: height / 2.1)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(radius: 5)
                    Spacer()
                    VStack {
                        Spacer()
                        Text(doctor.fullName)
                            .font(.callout.weight(.bold))
                            .frame(width: width / 2.2, height: height / 5.7, alignment: .topLeading)
                            .padding(.leading, 10)
                        Text(doctor.speciality)
                            .font(.subheadline)
                            .frame(width: width / 2.2, height: height / 4.2, alignment: .topLeading)
                            .padding(.leading, 10)
                        Spacer()
                    }
                    .frame(width: width / 2.1, height: height / 2.1)
                    Spacer()
                }
                .frame(width: width, height: height / 2.1)
                
                Picker("", selection: $selection) {
                    Text("О враче").tag("1")
                    Text("Отзывы").tag("2")
                }
                .pickerStyle(.segmented)
                .padding(.top, 8)
            }
            .frame(width: width, height: height / 1.5)
            
            VStack {
                if selection == "1" {
                    AboutTheDoctorEducationView(doctor: doctor)
                } else {
                    let doctorReviews = reviewsVM.reviews(forDoctor: doctor.fullName)
                    if doctorReviews.isEmpty {
                        Text("Пока нет отзывов. Оставьте свой!")
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
                    }
                }
                Spacer()
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
    AboutTheDoctorView(doctor: doctors[0])
        .environmentObject(ReviewsViewModel())
}
