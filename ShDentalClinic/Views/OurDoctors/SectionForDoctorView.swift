//
//  SectionForDoctorsView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 09.05.2025.
//

import SwiftUI

struct SectionForDoctorView: View {
    let doctor: Doctor
    
    @EnvironmentObject var reviewsVM: ReviewViewModel
    
    var body: some View {
        VStack {
            NavigationLink(destination: AboutTheDoctorView(doctor: doctor)) {
                VStack {
                    HStack(alignment: .top) {
                        AsyncImageView(
                            urlString: DoctorImageService.shared.imageURL(for: doctor.imageName),
                            width: 150,
                            cornerRadius: 10
                        )
                        
                        VStack {
                            Text(doctor.surname)
                            Text(doctor.name)
                            Text(doctor.patronymic)
                            Text(doctor.speciality)
                                .font(.footnote)
                                .padding(.top, 8)
                        }
                        .font(.callout.bold())
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                    }
                    .padding([.horizontal, .top])
                    
                    HStack {
                        NavigationLink(destination: AboutTheDoctorView(doctor: doctor)) {
                            HStack {
                                Image(systemName: "info.circle")
                                Text("О враче")
                                    .font(.subheadline.bold())
                            }
                            .foregroundStyle(.blue)
                        }
                        .padding()
                        
                        NavigationLink(destination: AppointmentSchedulingView()) {
                            HStack {
                                Image(systemName: "calendar")
                                Text("Записаться на прием")
                                    .font(.subheadline.bold())
                            }
                            .foregroundStyle(.blue)
                        }
                        .padding()
                    }
                }
                .background(.white)
                .cornerRadius(15)
                .padding(.horizontal)
                .shadow(radius: 4)
            }
        }
    }
}

#Preview {
    SectionForDoctorView(doctor: doctors[0])
        .environmentObject(ReviewViewModel())
}
