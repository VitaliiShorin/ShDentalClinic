//
//  RegistrationView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 24.05.2025.
//

import SwiftUI
// Готов
struct RegistrationView: View {
    @State private var phoneNumber = ""
    @State private var showError = false
    @State private var navigate = false
    @State private var area = ""
    
    @EnvironmentObject var userVM: UserViewModel
    
    private var digits: String { extractDigits(phoneNumber) }
    
    private var isButtonActive: Bool {
        phoneNumber.count == 11
    }
    
    var body: some View {
        ZStack {
            LinearGradientView()
            
            VStack {
                Text("Укажите Ваш номер телефона и регион:")
                
                CustomTextFieldView(placeholder: "+7", text: Binding(
                    get: { formattedPhoneNumber(phoneNumber) },
                    set: { newValue in self.phoneNumber = extractDigits(newValue) }
                ))
                .keyboardType(.phonePad)
                .padding(.vertical)
                
                CustomTextFieldView(placeholder: "Регион", text: $area)
                
                ZStack {
                    if showError {
                        Text("Такой пользователь уже зарегистрирован")
                            .foregroundColor(.red)
                            .font(.caption)
                            .multilineTextAlignment(.center)
                    } else {
                        Text("Такой пользователь уже зарегистрирован")
                            .font(.caption)
                            .multilineTextAlignment(.center)
                            .opacity(0)
                    }
                }
                
                Button {
                    if userVM.users.contains(where: { $0.phone == digits }) {
                        showError = true
                        navigate = false
                    } else {
                        showError = false
                        navigate = true
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
                .padding(.vertical)
                                
                NavigationLink(
                    destination: RegistrationFormView(phoneNumber: digits),
                    isActive: $navigate
                ) { EmptyView() }
                
                NavigationLink("У меня есть логин и пароль: \nВойти", destination: WelcomeView())
                    .font(.footnote)
                    .foregroundStyle(.blue)
                
                Spacer()
            }
            .padding(.horizontal, 32)
            .padding(.top, 32)
        }
    }
}

#Preview {
    RegistrationView()
}
