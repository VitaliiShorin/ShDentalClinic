//
//  EditProfileView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 02.06.2025.
//

import SwiftUI

struct EditProfileView: View {
    @State private var oldPassword = ""
    @State private var newPassword = ""
    @State private var repeatPassword = ""
    @State private var showError = false
    @State private var showAlertDelete = false
    @State private var showAlertLogout = false
    @State private var deleted = false
    @State private var logout = false
    @State private var showSuccessAlert = false
    
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
                    
                    PasswordInputFieldView(
                        title: "Cтарый пароль:",
                        text: $oldPassword,
                        error: showError ? "Неверный пароль" : nil
                    )
                    
                    PasswordInputFieldView(
                        title: "Установите новый пароль:",
                        text: $newPassword,
                        error: newPassword.count < 6 && !newPassword.isEmpty ? "Пароль должен содержать не менее 6 символов" : nil
                    )
                    
                    PasswordInputFieldView(
                        title: "Повторите новый пароль:",
                        text: $repeatPassword,
                        error: newPassword != repeatPassword && !repeatPassword.isEmpty ? "Пароли должны совпадать" : nil
                    )
                    
                    Button {
                        if userVM.changePassword(oldPassword: oldPassword, newPassword: newPassword) {
                            showError = false
                            showSuccessAlert = true
                            resetFields()
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
                    .alert(isPresented: $showSuccessAlert) {
                        Alert(
                            title: Text("Пароль успешно изменён"),
                            dismissButton: .default(Text("OK"))
                        )
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
        .hideKeyboardOnTap()
    }
    
    private func resetFields() {
        oldPassword = ""
        newPassword = ""
        repeatPassword = ""
        showError = false
    }
}

#Preview {
    EditProfileView()
        .environmentObject(UserViewModel())
}
