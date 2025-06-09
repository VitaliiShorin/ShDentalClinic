//
//  WelcomeView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 24.05.2025.
//

import SwiftUI

enum Destination: Hashable {
    case admin
    case user
}

struct WelcomeView: View {
    @State private var phoneNumber = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var showError = false
    @State private var goToNextView = false
    @State private var showPassword = false
    @State private var nextView: Destination?
    
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        ZStack {
            LinearGradientView()
            
            ScrollView(.vertical, showsIndicators: false) {
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
                        
                        NavigationLink(
                            destination: AdminAccountView().navigationBarBackButtonHidden(true),
                            tag: .admin, selection: $nextView
                        ) { EmptyView() }

                        NavigationLink(
                            destination: PersonalAccountView(),
                            tag: .user, selection: $nextView
                        ) { EmptyView() }
                        
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
    }
    
    // Проверка поля телефон и пароль
    // Нужен еще функционал "Телефон и пароль указаны неверно" при идентификации
    private func phoneAndPasswordFieldValidation() {
            let trimmed = phoneNumber.trimmingCharacters(in: .whitespaces)
            let phone = extractDigits(trimmed)
            
            // Данные для входа администратора
            let adminPhone = extractDigits("+7 999 999 9999")
            let adminPassword = "999999"
            
            if phoneNumber.isEmpty || password.isEmpty {
                errorMessage = "Поля Телефон и Пароль не могут быть пустыми"
                showError = true
            } else if phone == adminPhone && password == adminPassword {
                showError = false
                nextView = .admin
            } else if userVM.checkCredentials(phone: phone, password: password) {
                showError = false
                nextView = .user
            } else {
                errorMessage = "Телефон или пароль введены неверно"
                showError = true
            }
        }
}

#Preview {
    WelcomeView()
}
