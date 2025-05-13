//
//  AboutTheDoctorView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 10.05.2025.
//

import SwiftUI

struct AboutTheDoctorView: View {
    let photo: String
    let fullName: String
    let speciality: String
    let education: String
    let certificate: String
    let continuingEducation: String
    let professionalSkills: String
    
    
    @State var selection = "1"
    
    var body: some View {
        let width = UIScreen.main.bounds.width - 32
        let height = width
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack {
                    Spacer()
                    Image(photo)
                        .resizable()
                        .frame(width: width / 2.1, height: height / 2.1)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(radius: 5)
                    Spacer()
                    VStack {
                        Spacer()
                        Text(fullName)
                            .font(.callout.weight(.bold))
                            .frame(width: width / 2.2, height: height / 5.7, alignment: .topLeading)
                            .padding(.leading, 10)
                        Text(speciality)
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
                    AboutTheDoctorEducationView(education: education, certificate: certificate, continuingEducation: continuingEducation, professionalSkills: professionalSkills)
                } else {
                    // Необходимо передать данные из профиля пациента и раздела "Отзывы о нас" в дальнейшем
                    ReviewsAboutTheDoctorView(patientName: "Виктория", date: "5 дней назад", numberOfStars: "5", reviewText: "Отличный прием! Все прошло хорошо. Спасибо. ")
                }
                Spacer()
            }
        }
    }
}

#Preview {
    AboutTheDoctorView(photo: doctors[0].imageName, fullName: doctors[0].fullName, speciality: doctors[0].speciality, education: doctors[0].education, certificate: doctors[0].certificate, continuingEducation: doctors[0].continuingEducation, professionalSkills: doctors[0].professionalSkills)
}
