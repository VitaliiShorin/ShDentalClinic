//
//  ForgotPasswordView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 28.05.2025.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var phoneNumber = ""
    @State private var nextScreen = false
    @State private var showAlert = false
    
    @EnvironmentObject var userVM: UserViewModel
    
    private var isButtonActive: Bool {
        phoneNumber.count == 11
    }
    
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
                        set: { phoneNumber = extractDigits($0) }
                    ))
                    .keyboardType(.phonePad)
                    
                    Button {
                        if userVM.users.contains(where: { $0.phone == phoneNumber }) {
                            nextScreen.toggle()
                        } else {
                            showAlert.toggle()
                        }
                    } label: {
                        Text("Далее")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(isButtonActive ? .green : .gray)
                            .foregroundStyle(.white)
                            .cornerRadius(15)
                    }
                    .disabled(!isButtonActive)
                    .padding(.top)
                    .alert("Пользователь с таким номером не найден", isPresented: $showAlert) {
                        Button("OK", role: .cancel) { }
                    }
                    
                    NavigationLink(
                        destination: SetNewPasswordView(phoneNumber: phoneNumber),
                        isActive: $nextScreen
                    ) { EmptyView() }

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
        .hideKeyboardOnTap()
    }
}

#Preview {
    ForgotPasswordView()
        .environmentObject(UserViewModel())
}
