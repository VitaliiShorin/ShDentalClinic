//
//  SectionForDoctorsView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 09.05.2025.
//

import SwiftUI

struct SectionForDoctorsView: View {
    let fullName: String
    let speciality: String
    let imageName: String
    var screen1: Screen
    let action2: Screen
    let action3: Screen
    
    @State private var navigateToDetails = false
    @State private var navigateToAppointment = false
    @State private var navigateToDoctorInfo = false

    var body: some View {
        HStack {
            NavigationLink(destination: screen1.view, isActive: $navigateToDetails) {
                myCreateRectangleView(
                    fullName: fullName,
                    speciality: speciality,
                    imageName: imageName
                )
            }

            NavigationLink(destination: action2.view, isActive: $navigateToDoctorInfo) {
                EmptyView()
            }
            
            NavigationLink(destination: action3.view, isActive: $navigateToAppointment) {
                EmptyView()
            }
        }
    }
    
    private func myCreateRectangleView(
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
                        .frame(width: width / 2.1, height: width / 5.25)
                }
            }
            HStack {
                Button(action: {
                    navigateToDoctorInfo.toggle() // Переход к информации о враче
                }) {
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
    SectionForDoctorsView(
        fullName: "Аксенова\nВиктория\nВячеславовна",
        speciality: "Детский стоматолог\nТерапевт",
        imageName: "Виктория",
        screen1: .test1,
        action2: .test2,
        action3: .test3
    )
}
