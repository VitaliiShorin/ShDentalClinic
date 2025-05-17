//
//  SectionForDoctorsView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 09.05.2025.
//

import SwiftUI

struct SectionForDoctorView: View {
    let doctor: Doctor
    
    @EnvironmentObject var reviewsVM: ReviewsViewModel
    
    @State private var navigateToDetails = false
    @State private var navigateToAppointment = false
    @State private var navigateToDoctorInfo = false

    var body: some View {
        HStack {
            NavigationLink(destination: doctor.screen1.view, isActive: $navigateToDetails) {
                createSectionForDoctor(
                    fullName: doctor.fullName,
                    speciality: doctor.speciality,
                    imageName: doctor.imageName
                )
            }
            
            NavigationLink(destination: doctor.action3.view, isActive: $navigateToAppointment) {
                EmptyView()
            }
        }
    }
    
    private func createSectionForDoctor(
        fullName: String,
        speciality: String,
        imageName: String
    ) -> some View {
        let width = UIScreen.main.bounds.width - 32
        let height: CGFloat = UIScreen.main.bounds.height / 3.8
        
        return VStack {
            HStack {
                VStack {
                    Image(doctor.imageName)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(width: width / 2.5, height: width / 2.5)
                }
                VStack {
                    Text(doctor.fullName)
                        .font(.callout.bold())
                        .foregroundStyle(.black)
                        .frame(width: width / 2.1, height: width / 5.25)
                    Text(doctor.speciality)
                        .font(.footnote)
                        .foregroundStyle(.black)
                        .frame(width: width / 2.1, height: width / 5, alignment: .top)
                }
            }
            HStack {
                NavigationLink(destination: AboutTheDoctorView(doctor: doctor)) {
                    HStack {
                        Image(systemName: "info.circle")
                            .foregroundStyle(.blue)
                        Text("О враче")
                            .font(.subheadline.bold())
                            .foregroundStyle(.blue)
                    }
                }
                .frame(width: width / 2.5, height: width / 8)

                Button(action: {
                    navigateToAppointment.toggle() // Переход к записи на прием
                }) {
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundStyle(.blue)
                        Text("Записаться на прием")
                            .font(.subheadline.bold())
                            .foregroundStyle(.blue)
                    }
                }
                .frame(width: width / 2.1, height: width / 8)
            }
        }
        .frame(width: width, height: height)
        .background(.white)
        .cornerRadius(15)
        .shadow(radius: 4)
    }
}

#Preview {
    SectionForDoctorView(doctor: doctors[0])
        .environmentObject(ReviewsViewModel())
}
