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
    @State private var newPassword = ""
    @State private var repeatPassword = ""
    @State private var errorText = ""
    @State private var showPassword = false
    @State private var showError = false
    @State private var passwordChanged = false
    @State private var showAlertDelete = false
    @State private var showAlertLogout = false
    @State private var deleted = false
    @State private var logout = false
    
    @EnvironmentObject var userVM: UserViewModel
    
    private var isButtonActive: Bool {
        newPassword.count >= 6 &&
        newPassword == repeatPassword &&
        !oldPassword.isEmpty
    }
    
    var body: some View {
        ZStack {
            LinearGradientView()
            
            ScrollView(.vertical, showsIndicators: false) {
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
                        .opacity(showError ? 1 : 0)
                    
                    Text("Установите новый пароль:")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    ZStack(alignment: .trailing) {
                        if showPassword {
                            CustomTextFieldView(placeholder: "", text: $newPassword)
                        } else {
                            CustomSecureFieldView(placeholder: "", text: $newPassword)
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
                        .opacity(newPassword.count < 6 ? 1 : 0)
                    
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
                        .opacity(newPassword != repeatPassword ? 1 : 0)
                    
                    Button {
                        if userVM.changePassword(oldPassword: oldPassword, newPassword: newPassword) {
                            showError = false
                            passwordChanged = true
                        } else {
                            showError = true
                        }
                    } label: {
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
                    
                    if passwordChanged {
                        Text("Пароль успешно изменен")
                            .foregroundColor(.green)
                            .font(.caption)
                            .padding(.top, 10)
                    }
                    
                    Spacer()
                    
                    Button {
                        showAlertLogout.toggle()
                    } label: {
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
                    .alert(isPresented: $showAlertLogout) {
                        Alert(
                            title: Text("Вы уверены, что хотите выйти?"),
                            primaryButton: .cancel(),
                            secondaryButton: .destructive(Text("Выйти из аккаунта"), action: {
                                userVM.logout()
                                logout = true
                            })
                        )
                    }
                    
                    NavigationLink(destination: WelcomeView(), isActive: $logout) { EmptyView() }
                    
                    
                    Button {
                        showAlertDelete.toggle()
                    } label: {
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
                    .alert(isPresented: $showAlertDelete) {
                        Alert(
                            title: Text("Вы уверены, что хотите удалить свой профиль?"),
                            primaryButton: .cancel(),
                            secondaryButton: .destructive(Text("Удалить профиль"), action: {
                                userVM.deleteCurrentUser()
                                deleted = true
                            })
                        )
                    }
                    
                    NavigationLink(destination: WelcomeView(), isActive: $deleted) {
                        EmptyView()
                    }
                }
                .padding(.horizontal, 32)
            }
        }
    }
}

#Preview {
    EditProfileView()
        .environmentObject(UserViewModel())
}
