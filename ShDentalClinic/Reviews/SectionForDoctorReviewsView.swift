//
//  SectionOfADoctorFoReviewView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 14.05.2025.
//

import SwiftUI

struct SectionForDoctorReviewsView: View {
    let doctor: Doctor
    let numberOfStars: String
    
    @EnvironmentObject var reviewsVM: ReviewsViewModel
    @State private var navigateToDetails = false
    
    var body: some View {
        NavigationLink(destination: ReadAndWriteAReviewView(doctor: doctor), isActive: $navigateToDetails) {
            HStack {
                Image(doctor.imageName)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: 90, height: 90)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                
                VStack(alignment: .leading) {
                    Text(doctor.surname)
                    Text(doctor.name)
                    Text(doctor.patronymic)
                }
                .font(.callout.bold())
                .foregroundStyle(.black)
                
                Spacer()
                
                HStack(spacing: 5) {
                    Image(systemName: "star.fill")
                        .font(.body)
                        .foregroundStyle(.gold)
                    Text(numberOfStars)
                        .font(.body.bold())
                        .foregroundStyle(.black)
                }
                .padding(.trailing)
                
            }
            .background(.white)
            .cornerRadius(15)
            .shadow(radius: 1)
        }
    }
}

#Preview {
    SectionForDoctorReviewsView(doctor: doctors[0], numberOfStars: "4,6")
        .environmentObject(ReviewsViewModel())
}
