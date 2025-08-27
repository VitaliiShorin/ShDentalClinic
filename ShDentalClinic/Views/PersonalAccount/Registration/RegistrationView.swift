//
//  RegistrationView.swift
//  ShDentalClinic
//
//  Created by Виталий Шорин on 24.05.2025.
//

import SwiftUI

struct RegistrationView: View {
    @State private var phoneNumber = ""
    @State private var showError = false
    @State private var navigate = false
    @State private var area = ""
    
    @EnvironmentObject var userVM: UserViewModel
    
    private var digits: String { extractDigits(phoneNumber) }
    
    private var isButtonActive: Bool {
        phoneNumber.count == 11 && !area.isEmpty
    }
    
    var body: some View {
        ZStack {
            LinearGradientView()
            
            VStack {
                Text("Укажите Ваш номер телефона и регион:")
                
                CustomTextFieldView(placeholder: "+7", text: Binding(
                    get: { formattedPhoneNumber(phoneNumber) },
                    set: { phoneNumber = extractDigits($0) }
                ))
                .keyboardType(.phonePad)
                .padding(.vertical)
                
                CustomTextFieldView(placeholder: "Регион", text: $area)
                
                Text("Такой пользователь уже зарегистрирован")
                    .foregroundColor(.red)
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .opacity(showError ? 1 : 0)
                
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
            .padding([.horizontal, .top], 32)
        }
        .hideKeyboardOnTap()
    }
}

#Preview {
    RegistrationView()
}
