//
//  PersonalAccountView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 02.06.2025.
//

import SwiftUI

struct PersonalAccountView: View {
    
    var body: some View {
        ZStack {
            LinearGradientView()
            
            VStack {
                HStack {
                    Image(systemName: "person.crop.square")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.blue)
                    
                    Text("Виталий")
                        .font(.title2.bold())

                }
                .padding(.top, 32)
                .padding(.bottom, 6)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    NavigationLink("Изменить профиль", destination: EditProfileView())
                        .foregroundStyle(.blue)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 32)

                VStack(alignment: .leading, spacing: 10) {
                    createSection(image: "person.circle.fill", title: "Пол:", information: "Мужской")
                    
                    createSection(image: "birthday.cake.fill", title: "День рождения:", information: "29.07.1990")
                    
                    createSection(image: "phone", title: "Номер телефона:", information: "+7 (911) 123-45-67")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                CustomNLButtonView(text: "Мои записи на прием", destination: MyAppointmentsView())
                    .padding(.top, 32)
                
                
                Spacer()
            }
            .padding(.horizontal, 16)
            .navigationTitle("Личный кабинет")
        }
    }
    
    private func createSection(image: String, title: String, information: String) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: image)
                    .foregroundStyle(.blue)
                Text(title)
                    .font(.body.bold())
            }
            .padding(.bottom, 2)
            Text(information)
                .font(.callout)
                .padding(.leading, 12)
        }
    }
}

#Preview {
    PersonalAccountView()
}
