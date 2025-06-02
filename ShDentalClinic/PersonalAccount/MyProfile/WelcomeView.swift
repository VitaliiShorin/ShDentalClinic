//
//  WelcomeView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 24.05.2025.
//

import SwiftUI
// Готов
struct WelcomeView: View {
    @State private var phoneNumber = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var showError = false
    @State private var goToNextView = false
    @State private var showPassword = false
    
    var body: some View {
        ZStack {
            LinearGradientView()
            
            VStack {
                Text("Добро пожаловать!")
                    .font(.title2.bold())
                    .padding(.bottom, 32)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Телефон")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    CustomTextFieldView(placeholder: "+7", text: Binding(
                        get: { formattedPhoneNumber(phoneNumber) },
                        set: { newValue in self.phoneNumber = extractDigits(newValue) }
                    ))
                    .keyboardType(.phonePad)
                    
                    Text("Пароль")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    ZStack(alignment: .trailing) {
                        if showPassword {
                            CustomTextFieldView(placeholder: "Пароль", text: $password)
                        } else {
                            CustomSecureFieldView(placeholder: "Пароль", text: $password)
                        }
                        
                        Button {
                            showPassword.toggle()
                        } label: {
                            Image(systemName: showPassword ? "eye.slash" : "eye")
                                .foregroundStyle(.gray)
                        }
                        .padding(.trailing, 12)
                    }
                }
                
                HStack {
                    Spacer()
                    NavigationLink("Забыли пароль?", destination: ForgotPasswordView())
                        .font(.footnote)
                        .foregroundStyle(.blue)
                        .padding(.trailing, 8)
                }
                
                Text(errorMessage)
                    .foregroundStyle(.red)
                    .font(.caption)
                    .padding(.top)
                    .frame(height: 16)
                    .opacity(showError ? 1 : 0)
                
                VStack(spacing: 12) {
                    Button(action: {
                        phoneAndPasswordFieldValidation()
                    }) {
                        Text("Вход")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.green)
                            .foregroundStyle(.white)
                            .cornerRadius(15)
                    }
                    
                    NavigationLink(destination: PersonalAccountView(), isActive: $goToNextView) { EmptyView() }
                    
                    NavigationLink(destination: RegistrationView()) {
                        Text("Регистрация")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.green, lineWidth: 2)
                            )
                            .foregroundStyle(.green)
                    }
                }
                .padding(.top)
                
                Spacer()
            }
            .padding(.horizontal, 32)
            .padding(.top, 30)
        }
        
    }
    
    // Проверка поля телефон и пароль
    // Нужен еще функционал "Телефон и пароль указаны неверно" при идентификации
    private func phoneAndPasswordFieldValidation() {
        let phone = extractDigits(phoneNumber)
        if phoneNumber.isEmpty || password.isEmpty {
            errorMessage = "Поля Телефон и Пароль не могут быть пустыми"
            showError = true
        } else if phone.count != 11 {
            errorMessage = "Неверный формат телефона (11 цифр с 8 или 7)"
            showError = true
        } else {
            showError = false
            goToNextView = true
        }
        
    }
}

#Preview {
    WelcomeView()
}
