//
//  EditProfileView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 02.06.2025.
//

import SwiftUI
// Изменить профиль
struct EditProfileView: View {
    @State private var oldPassword = ""
    @State private var password = ""
    @State private var repeatPassword = ""
    @State private var showPassword = false
    
    private var isButtonActive: Bool {
        password.count >= 6 && password == repeatPassword
    }
    
    var body: some View {
        ZStack {
            LinearGradientView()
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Изменить пароль")
                    .font(.headline)
                
                Text("Cтарый пароль:")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                ZStack(alignment: .trailing) {
                    if showPassword {
                        CustomTextFieldView(placeholder: "", text: $oldPassword)
                    } else {
                        CustomSecureFieldView(placeholder: "", text: $oldPassword)
                    }
                    
                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                            .foregroundStyle(.gray)
                    }
                    .padding(.trailing, 12)
                }
                
                Text("Неверный пароль")
                    .foregroundStyle(.red)
                    .font(.caption)
                    .opacity(oldPassword != password ? 1 : 0) // Изменить логику
                
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
                
                NavigationLink(destination: TestView()) {
                    Text("Сохранить")
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
                
                NavigationLink(destination: WelcomeView()) {
                    Text("Выйти из аккаунта")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.green, lineWidth: 2)
                        )
                        .foregroundStyle(.green)
                }
                
                NavigationLink(destination: TestView()) {
                    Text("Удалить профиль")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.red, lineWidth: 2)
                        )
                        .foregroundStyle(.red)
                }
                
                
            }
            .padding()
        }
    }
}


#Preview {
    EditProfileView()
}
