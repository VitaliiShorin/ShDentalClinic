//
//  AboutTheDoctorView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 10.05.2025.
//

import SwiftUI

struct AboutTheDoctorView: View {
    let photo1: String
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
                    Image(photo1)
                        .resizable()
                        .frame(width: width / 2.1, height: height / 2.1)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(radius: 5)
                    Spacer()
                    VStack {
                        Spacer()
                        Text(fullName)
                            .font(.system(size: 16, weight: .bold))
                            .frame(width: width / 2.2, height: height / 6, alignment: .topLeading)
                            .padding(.leading, 10)
                        Text(speciality)
                            .font(.system(size: 14))
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
                    Text("График").tag("2")
                    Text("Отзывы").tag("3")
                }
                .pickerStyle(.segmented)
                .padding(.top, 8)
            }
            .frame(width: width, height: height / 1.5)
            
                VStack {
                    if selection == "1" {
                        AboutTheDoctorEducationView(education: education, certificate: certificate, continuingEducation: continuingEducation, professionalSkills: professionalSkills)
                    }
                    Spacer()
                }
            
        }
    }
}

#Preview {
    AboutTheDoctorView(photo1: doctors[0].imageName, fullName: doctors[0].fullName, speciality: doctors[0].speciality, education: doctors[0].education, certificate: doctors[0].certificate, continuingEducation: doctors[0].continuingEducation, professionalSkills: doctors[0].professionalSkills)
}
