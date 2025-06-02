//
//  RegistrationView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 24.05.2025.
//

import SwiftUI
// Готов
struct RegistrationView: View {
    @State private var phoneNumber = ""
    
    var body: some View {
        ZStack {
            LinearGradientView()
            
            VStack(spacing: 32) {
                Text("Укажите Ваш номер телефона:")
                
                CustomTextFieldView(placeholder: "+7", text: $phoneNumber)
                    .keyboardType(.phonePad)
                
                CustomNLButtonView(text: "Далее", destination: RegistrationFormView())
                
                NavigationLink("У меня есть логин и пароль: \nВойти", destination: WelcomeView())
                    .font(.footnote)
                    .foregroundStyle(.blue)
                
                Spacer()
            }
            .padding(.horizontal, 32)
            .padding(.top, 32)
        }
        
    }
}

#Preview {
    RegistrationView()
}
