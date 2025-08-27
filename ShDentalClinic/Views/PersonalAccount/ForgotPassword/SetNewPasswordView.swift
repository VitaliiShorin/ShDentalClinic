//
//  SetNewPasswordView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 28.05.2025.
//

import SwiftUI

struct SetNewPasswordView: View {
    let phoneNumber: String
    
    @State private var password = ""
    @State private var repeatPassword = ""
    @State private var showError = false
    @State private var passwordChanged = false
    
    @EnvironmentObject var userVM: UserViewModel
    
    private var isButtonActive: Bool {
        password.count >= 6 && password == repeatPassword
    }
    
    var body: some View {
        ZStack {
            LinearGradientView()
            
            VStack {
                Text("Сбросить пароль")
                    .font(.title3.bold())
                    .padding(.bottom)
                
                VStack(alignment: .leading, spacing: 8) {
                    PasswordInputFieldView(
                        title: "Установите новый пароль:",
                        text: $password,
                        error: password.count < 6 ? "Пароль должен быть не менее 6 символов" : nil
                    )
                    
                    PasswordInputFieldView(
                        title: "Повторите новый пароль:",
                        text: $repeatPassword,
                        error: password != repeatPassword ? "Пароли должны совпадать" : nil
                    )
                    
                    Button {
                        if userVM.resetPassword(for: phoneNumber, newPassword: password) {
                            passwordChanged = true
                        } else {
                            showError = true
                        }
                    } label: {
                        Text("Завершить")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(isButtonActive ? .green : .gray)
                            .foregroundStyle(.white)
                            .cornerRadius(15)
                    }
                    .disabled(!isButtonActive)
                    .padding(.top, 10)
                    .alert("Ошибка! Не удалось сменить пароль", isPresented: $showError) {
                        Button("OK", role: .cancel) { }
                    }
                    
                    NavigationLink(
                        "",
                        destination: PasswordChangedSuccessfullyView(),
                        isActive: $passwordChanged
                    )
                    
                    Spacer()
                }
                .padding(.horizontal, 32)
            }
        }
        .hideKeyboardOnTap()
    }
}

#Preview {
    SetNewPasswordView(phoneNumber: "")
}
