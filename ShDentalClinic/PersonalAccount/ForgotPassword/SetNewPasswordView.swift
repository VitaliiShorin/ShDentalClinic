//
//  SetNewPasswordView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 28.05.2025.
//

import SwiftUI
// Готов
struct SetNewPasswordView: View {
    @State private var password = ""
    @State private var repeatPassword = ""
    @State private var showPassword = false
    
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
                    Text("Установите новый пароль:")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    ZStack(alignment: .trailing) {
                        if showPassword {
                            CustomTextFieldView(placeholder: "", text: $password)
                        } else {
                            CustomSecureFieldView(placeholder: "", text: $password)
                        }
                        
                        Button {
                            showPassword.toggle()
                        } label: {
                            Image(systemName: showPassword ? "eye.slash" : "eye")
                                .foregroundStyle(.gray)
                        }
                        .padding(.trailing, 12)
                    }
                    
                    Text("Пароль должен содержать не менее 6 символов")
                        .foregroundStyle(.red)
                        .font(.caption)
                        .opacity(password.count < 6 ? 1 : 0)
                    
                    Text("Повторите новый пароль:")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    ZStack(alignment: .trailing) {
                        if showPassword {
                            CustomTextFieldView(placeholder: "", text: $repeatPassword)
                        } else {
                            CustomSecureFieldView(placeholder: "", text: $repeatPassword)
                        }
                        
                        Button {
                            showPassword.toggle()
                        } label: {
                            Image(systemName: showPassword ? "eye.slash" : "eye")
                                .foregroundStyle(.gray)
                        }
                        .padding(.trailing, 12)
                    }
                    
                    Text("Пароли должны совпадать")
                        .foregroundStyle(.red)
                        .font(.caption)
                        .opacity(password != repeatPassword ? 1 : 0)
                    
                    NavigationLink(destination: PasswordChangedSuccessfullyView()) {
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
                    
                    Spacer()
                    
                }
                .padding(.horizontal, 32)
            }
        }
    }
}

#Preview {
    SetNewPasswordView()
}
