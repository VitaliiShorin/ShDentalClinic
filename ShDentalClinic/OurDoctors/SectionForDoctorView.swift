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
    let doctor: Doctor
    
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
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                        .frame(width: width / 2.1, height: width / 5.25)
                    Text(speciality)
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                        .frame(width: width / 2.1, height: width / 5.25, alignment: .top)
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
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.blue)
                    }
                }
                .frame(width: width / 2.5, height: width / 9)

                Button(action: {
                    navigateToAppointment.toggle() // Переход к записи на прием
                }) {
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(.blue)
                        Text("Записаться на прием")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.blue)
                    }
                }
                .frame(width: width / 2.1, height: width / 9)
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
        fullName: "Аксенова\nВиктория\nВячеславовна",
        speciality: "Детский стоматолог\nТерапевт",
        imageName: "Виктория",
        education: "Медицинская академия им. Н.И.Ломоносова",
        certificate: "",
        continuingEducation: "",
        professionalSkills: "",
        screen1: .test1,
        action2: .test2,
        action3: .test3,
        doctor: .init(
            fullName: "Аксенова\nВиктория\nВячеславовна",
            speciality: "Детский стоматолог\nТерапевт",
            imageName: "Виктория",
            education: "Медицинская академия им. Н.И.Ломоносова",
            certificate: "",
            continuingEducation: "",
            professionalSkills: "",
            screen1: .test1,
            action2: .test2,
            action3: .test3
        )
    )
}

