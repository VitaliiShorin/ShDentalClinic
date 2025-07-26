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
                            set: { phoneNumber = extractDigits($0) }
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
                    
                    if !errorMessage.isEmpty {
                        Text(errorMessage)
                            .foregroundStyle(.red)
                            .font(.caption)
                            .padding(.top)
                            .transition(.opacity)
                    } else {
                        Color.clear.frame(height: 16)
                    }
                    
                    VStack(spacing: 12) {
                        Button(action: {
                            loginAction()
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
        .hideKeyboardOnTap()
    }
    
    private func loginAction() {
        let phone = extractDigits(phoneNumber.trimmingCharacters(in: .whitespaces))
        
        let adminPhone = extractDigits("+7 999 999 9999")
        let adminPassword = "999999"
        
        guard !phoneNumber.isEmpty, !password.isEmpty else {
            errorMessage = "Поля Телефон и Пароль не могут быть пустыми"
            return
        }
        
        if phone == adminPhone && password == adminPassword {
            errorMessage = ""
            nextView = .admin
        } else if userVM.checkCredentials(phone: phone, password: password) {
            errorMessage = ""
            nextView = .user
        } else {
            errorMessage = "Телефон или пароль указаны неверно"
        }
    }
}

#Preview {
    WelcomeView()
}
