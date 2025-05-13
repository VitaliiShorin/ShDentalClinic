//
//  SectionForDoctorsView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 09.05.2025.
//

import SwiftUI

struct SectionForDoctorView: View {
    let fullName: String
    let speciality: String
    let imageName: String
    let education: String
    let certificate: String
    let continuingEducation: String
    let professionalSkills: String
    var screen1: Screen
    let action2: Screen
    let action3: Screen
    
    @State private var navigateToDetails = false
    @State private var navigateToAppointment = false
    @State private var navigateToDoctorInfo = false

    var body: some View {
        HStack {
            NavigationLink(destination: screen1.view, isActive: $navigateToDetails) {
                createSectionForDoctor(
                    fullName: fullName,
                    speciality: speciality,
                    imageName: imageName
                )
            }
            
            NavigationLink(destination: action3.view, isActive: $navigateToAppointment) {
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
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(width: width / 2.5, height: width / 2.5)
                }
                VStack {
                    Text(fullName)
                        .font(.callout.bold())
                        .foregroundColor(.black)
                        .frame(width: width / 2.1, height: width / 5.25)
                    Text(speciality)
                        .font(.footnote)
                        .foregroundColor(.black)
                        .frame(width: width / 2.1, height: width / 5, alignment: .top)
                }
            }
            HStack {
                NavigationLink(
                    destination: AboutTheDoctorView(
                        photo: imageName,
                        fullName: fullName,
                        speciality: speciality,
                        education: education,
                        certificate: certificate,
                        continuingEducation: continuingEducation,
                        professionalSkills: professionalSkills
                    )
                ) {
                    HStack {
                        Image(systemName: "info.circle")
                            .foregroundColor(.blue)
                        Text("О враче")
                            .font(.subheadline.bold())
                            .foregroundColor(.blue)
                    }
                }
                .frame(width: width / 2.5, height: width / 8)

                Button(action: {
                    navigateToAppointment.toggle() // Переход к записи на прием
                }) {
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(.blue)
                        Text("Записаться на прием")
                            .font(.subheadline.bold())
                            .foregroundColor(.blue)
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
    SectionForDoctorView(
        fullName: doctors[3].fullName,
        speciality: doctors[3].speciality,
        imageName: doctors[3].imageName,
        education: doctors[3].education,
        certificate: doctors[3].certificate,
        continuingEducation: doctors[3].continuingEducation,
        professionalSkills: doctors[3].professionalSkills,
        screen1: .test1,
        action2: .test2,
        action3: .test3
    )
}
