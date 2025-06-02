//
//  ForgotPasswordView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 28.05.2025.
//

import SwiftUI
// Готов
struct ForgotPasswordView: View {
    @State private var phoneNumber = ""
    
    var body: some View {
        ZStack {
            LinearGradientView()
            
            VStack {
                Text("Сбросить пароль")
                    .font(.title3.bold())
                    .padding(.bottom)
                
                VStack(alignment: .leading)  {
                    Text("Укажите номер телефона:")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    CustomTextFieldView(placeholder: "+7", text: Binding(
                        get: { formattedPhoneNumber(phoneNumber) },
                        set: { newValue in self.phoneNumber = extractDigits(newValue) }
                    ))
                    .keyboardType(.phonePad)
                    
                    CustomNLButtonView(text: "Далее", destination: SetNewPasswordView())
                        .padding(.top)
                }
                .padding(.bottom)
                
                NavigationLink(
                    destination: WelcomeView()) {
                        Text("У меня есть логин и пароль: \nВойти")
                            .font(.footnote)
                            .foregroundStyle(.blue)
                            .frame(maxWidth: .infinity)
                    }
                
                Spacer()
            }
            .padding(.horizontal, 32)
        }
    }
}

#Preview {
    ForgotPasswordView()
}
