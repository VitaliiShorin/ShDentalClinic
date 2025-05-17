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
            createSectionForDoctorReviews(
                fullName: doctor.fullName,
                imageName: doctor.imageName,
                numberOfStars: numberOfStars
            )
        }
    }
    
    private func createSectionForDoctorReviews(
        fullName: String,
        imageName: String,
        numberOfStars: String
    ) -> some View {
        let width = UIScreen.main.bounds.width - 32
        let height: CGFloat = UIScreen.main.bounds.height / 10
        
        return HStack {
            Image(doctor.imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: width / 5, height: width / 5)
                .padding(.leading)
                .padding(.trailing)
            
            Text(doctor.fullName)
                .font(.callout.bold())
                .foregroundStyle(.black)
                .multilineTextAlignment(.leading)
                .frame(height: width / 5)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                HStack(spacing: 5) {
                    Image(systemName: "star.fill")
                        .font(.body)
                        .foregroundStyle(.gold)
                        .scaledToFit()
                    Text(numberOfStars)
                        .font(.body.bold())
                        .foregroundStyle(.black)
                }
            }
            .padding(.trailing)
            .frame(height: width / 5, alignment: .center)
            
        }
        .frame(width: width, height: height)
        .background(.white)
        .cornerRadius(15)
        .shadow(radius: 1)
    }
}

#Preview {
    SectionForDoctorReviewsView(doctor: doctors[0], numberOfStars: "4,6")
        .environmentObject(ReviewsViewModel())
}
